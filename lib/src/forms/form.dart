import 'dart:developer';
import 'package:flutter/material.dart';

import '../src.dart';

class IsmailForm extends StatefulWidget {
  const IsmailForm({
    Key? key,
    required this.child,
    this.enabled = true,
    this.initialValue = const <String, dynamic>{},
    this.onChanged,
    this.autovalidateMode,
    this.onWillPop,
    this.skipDisabled = true,
  }) : super(key: key);
  final Widget child;
  final bool enabled;
  final Map<String, dynamic> initialValue;
  final VoidCallback? onChanged;
  final AutovalidateMode? autovalidateMode;
  final WillPopCallback? onWillPop;
  final bool skipDisabled;

  @override
  IsmailFormState createState() => IsmailFormState();

  static IsmailFormState? of(BuildContext context) =>
      context.findAncestorStateOfType<IsmailFormState>();
}

class IsmailFormState extends State<IsmailForm> {
  final _formKey = GlobalKey<FormState>();

  bool get enabled => widget.enabled;

  final _fields = <String, IsmailFormFieldState>{};

  final _value = <String, dynamic>{};

  Map<String, dynamic> get value => Map<String, dynamic>.unmodifiable(_value);

  Map<String, dynamic> get initialValue => widget.initialValue;

  Map<String, IsmailFormFieldState> get fields => _fields;

  void setInternalFieldValue(String name, dynamic value) {
    setState(() {
      _value[name] = value;
    });
  }

  void removeInternalFieldValue(String name) {
    setState(() {
      _value.remove(name);
    });
  }

  void registerField(String name, IsmailFormFieldState field) {
    assert(() {
      if (_fields.containsKey(name)) {
        ismailLog(
          'Warning! Replacing duplicate Field for $name'
          ' -- this is OK to ignore as long as the field was intentionally replaced',
        );
      }
      return true;
    }());
    ismailLog('Registered field $name');
    _fields[name] = field;
  }

  void unregisterField(String name, IsmailFormFieldState field) {
    assert(_fields.containsKey(name));
    if (field == _fields[name]) {
      ismailLog('Unregistered field $name');
      _fields.remove(name);
    } else {
      assert(() {
        ismailLog(
          'Warning! Ignoring Field unregistration for $name'
          ' -- this is OK to ignore as long as the field was intentionally replaced',
        );
        return true;
      }());
    }
  }

  void save() {
    _formKey.currentState!.save();
  }

  bool validate() {
    return _formKey.currentState!.validate();
  }

  bool saveAndValidate() {
    save();
    return validate();
  }

  void reset() {
    _formKey.currentState!.reset();
  }

  void patchValue(Map<String, dynamic> val) {
    val.forEach((key, dynamic value) {
      _fields[key]?.didChange(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: widget.autovalidateMode,
      onWillPop: widget.onWillPop,
      onChanged: widget.onChanged,
      child: FocusTraversalGroup(
        policy: WidgetOrderTraversalPolicy(),
        child: widget.child,
      ),
    );
  }
}
