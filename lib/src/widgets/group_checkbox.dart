import 'package:flutter/material.dart';

import '../src.dart';

class GroupCheckBox<T> extends StatefulWidget {
  const GroupCheckBox({
    Key? key,
    this.value,
    required this.options,
    required this.onChanged,
    required this.controlAffinity,
  }) : super(key: key);
  final List<T>? value;
  final List<IsmailFormFieldItem<T>> options;
  final ValueChanged<List<T>> onChanged;
  final ControlAffinity controlAffinity;
  @override
  _GroupCheckBoxState<T> createState() => _GroupCheckBoxState<T>();
}

class _GroupCheckBoxState<T> extends State<GroupCheckBox<T>> {
  final _selectedListItems = <T>[];
  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      _selectedListItems.addAll(widget.value!);
    }
  }

  void _onChange(bool value, IsmailFormFieldItem<T> item) {
    if (value) {
      _selectedListItems.add(item.value);
    } else {
      _selectedListItems.remove(item.value);
    }
    widget.onChanged(_selectedListItems);
  }

  Widget _item(IsmailFormFieldItem<T> item) {
    final control = Checkbox(
      value: _selectedListItems.contains(item.value),
      onChanged: (value) {
        value ??= false;
        _onChange(value, item);
      },
    );
    final label = GestureDetector(
      onTap: () {
        final value = _selectedListItems.contains(item.value);
        _onChange(value, item);
      },
      child: item,
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.controlAffinity.leading) control,
        Flexible(child: label),
        if (widget.controlAffinity.trailing) control,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [for (var item in widget.options) _item(item)],
    );
  }
}
