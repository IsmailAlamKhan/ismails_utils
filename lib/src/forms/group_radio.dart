import 'package:flutter/material.dart';

import '../src.dart';

class GroupRadio<T> extends StatefulWidget {
  const GroupRadio({
    Key? key,
    this.value,
    required this.options,
    required this.onChanged,
    required this.controlAffinity,
  }) : super(key: key);
  final T? value;
  final List<FormFieldItem<T>> options;
  final ValueChanged<T> onChanged;
  final ControlAffinity controlAffinity;
  @override
  _GroupRadioState<T> createState() => _GroupRadioState<T>();
}

class _GroupRadioState<T> extends State<GroupRadio<T>> {
  Widget _item(FormFieldItem<T> item) {
    final control = Radio<T>(
      groupValue: widget.value,
      value: item.value,
      onChanged: (value) {
        if (value != null) {
          widget.onChanged(value);
        }
      },
    );
    final label = GestureDetector(
      onTap: () => widget.onChanged(item.value),
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
