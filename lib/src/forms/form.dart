import 'dart:async';

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
    this.controller,
  }) : super(key: key);
  final Widget child;
  final bool enabled;
  final Map<String, dynamic> initialValue;
  final ValueChanged<Map<String, dynamic>>? onChanged;
  final AutovalidateMode? autovalidateMode;
  final WillPopCallback? onWillPop;
  final bool skipDisabled;
  final IsmailFormController? controller;

  @override
  IsmailFormState createState() => IsmailFormState();

  static IsmailFormState? of(BuildContext context) =>
      context.findAncestorStateOfType<IsmailFormState>();
}

class IsmailFormState extends State<IsmailForm> {
  late final IsmailFormController controller =
      widget.controller ?? IsmailFormController();
  Map<String, dynamic> get initialValue {
    return widget.initialValue;
  }

  //* values, methods taken from the controller
  //* ----------------------------------------
  Map<String, dynamic> get value => controller.value;
  Map<String, IsmailFormFieldState> get fields => controller.fields;
  List<IsmailFormFieldState> get inValidFields => controller.inValidFields;
  bool get isValid => controller.isValid;
  void setInternalFieldValue(String name, dynamic value) =>
      controller.setInternalFieldValue(name, value);
  void removeInternalFieldValue(String name) =>
      controller.removeInternalFieldValue(name);
  void registerField(String name, IsmailFormFieldState field) =>
      controller.registerField(name, field);
  void unregisterField(String name, IsmailFormFieldState field) =>
      controller.unregisterField(name, field);
  void save() => controller.save();
  bool validate() => controller.validate();
  bool saveAndValidate() => controller.saveAndValidate();
  void patchValue(Map<String, dynamic> val) => controller.patchValue(val);
  //* -----------------------------------------

  bool get enabled => widget.enabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller._formKey,
      autovalidateMode: widget.autovalidateMode,
      onWillPop: widget.onWillPop,
      onChanged: () => controller._onFormChange(widget.onChanged),
      child: FocusTraversalGroup(
        policy: WidgetOrderTraversalPolicy(),
        child: widget.child,
      ),
    );
  }
}

class IsmailFormController extends ChangeNotifier {
  Map<String, dynamic> get value => Map<String, dynamic>.unmodifiable(_value);
  Map<String, dynamic> get fieldsWithoutDisposed =>
      Map<String, dynamic>.unmodifiable(_fieldsWithoutDisposed);
  Map<String, IsmailFormFieldState> get fields =>
      Map<String, IsmailFormFieldState>.unmodifiable(_fields);
  List<IsmailFormFieldState> get inValidFields =>
      List<IsmailFormFieldState>.unmodifiable(_inValidFields);
  bool get isValid => _isValid;

  void setInternalFieldValue(String name, dynamic value) {
    assert(_formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    _value[name] = value;
    notifyListeners();
  }

  void removeInternalFieldValue(String name) {
    assert(_formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    _value.remove(name);
    notifyListeners();
  }

  void registerField(String name, IsmailFormFieldState field) {
    assert(_formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    assert(() {
      if (_fields.containsKey(name)) {
        ismailFormLog.warning(
          'Warning! Replacing duplicate Field for $name'
          ' -- this is OK to ignore as long as the field was intentionally replaced',
        );
      }
      return true;
    }());
    ismailFormLog.info('Registered field $name');
    _fields[name] = field;
    _fieldsWithoutDisposed[name] = field;
    if (!field.isValid) {
      _inValidFields.add(field);
    }
    _isValid = _inValidFields.isEmpty;
    Future.microtask(() => notifyListeners());
  }

  void unregisterField(String name, IsmailFormFieldState field) {
    assert(_formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    if (field == _fields[name]) {
      ismailFormLog.info('Unregistered field $name');
      _fields.remove(name);

      _inValidFields.remove(field);
      _isValid = _inValidFields.isEmpty;

      Future.microtask(() => notifyListeners());
    } else {
      assert(() {
        ismailFormLog.warning(
          'Warning! Ignoring Field unregistration for $name'
          ' -- this is OK to ignore as long as the field was intentionally replaced',
        );
        return true;
      }());
    }
  }

  void save() {
    assert(_formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    _formKey.currentState!.save();
  }

  bool validate() {
    assert(_formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    return _formKey.currentState!.validate();
  }

  bool saveAndValidate() {
    assert(_formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    save();
    return validate();
  }

  void reset() {
    assert(_formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    _formKey.currentState!.reset();
  }

  void patchValue(Map<String, dynamic> val) {
    val.forEach((key, dynamic value) {
      _fields[key]?.didChange(value);
    });
  }

  final _formKey = GlobalKey<FormState>();
  final _fields = <String, IsmailFormFieldState>{};
  final _fieldsWithoutDisposed = <String, IsmailFormFieldState>{};
  final _value = <String, dynamic>{};
  final _inValidFields = <IsmailFormFieldState>[];
  bool _isValid = false;

  void _onFormChange(ValueChanged<Map<String, dynamic>>? onChanged) {
    assert(_formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    final fields = <String, dynamic>{};
    for (final item in _fields.keys) {
      final field = _fields[item];
      final value = field?.value;
      fields.addAll({item: value});
      if (!field!.isValid) {
        if (!_inValidFields.contains(field)) {
          _inValidFields.add(field);
        }
      } else {
        _inValidFields.remove(field);
      }
    }
    _isValid = _inValidFields.isEmpty;
    notifyListeners();
    onChanged?.call(fields);
  }
}
