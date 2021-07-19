import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../src.dart';

/// The FormController which holds the state of [IsmailForm]
class IsmailFormController extends ChangeNotifier {
  void setInternalFieldValue(String name, dynamic value) {
    assert(formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    _value[name] = value;
    notifyListeners();
  }

  void removeInternalFieldValue(String name) {
    assert(formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    _value.remove(name);
    notifyListeners();
  }

  void registerField(String name, IsmailFormFieldState field) {
    assert(formKey.currentState != null,
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
    Future.microtask(notifyListeners);
  }

  void unregisterField(String name, IsmailFormFieldState field) {
    assert(formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    if (field == _fields[name]) {
      ismailFormLog.info('Unregistered field $name');
      _fields.remove(name);

      _inValidFields.remove(field);
      _isValid = _inValidFields.isEmpty;

      Future.microtask(notifyListeners);
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
    assert(formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    formKey.currentState!.save();
  }

  bool validate() {
    assert(formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    return formKey.currentState!.validate();
  }

  bool saveAndValidate() {
    assert(formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    save();
    return validate();
  }

  void reset() {
    assert(formKey.currentState != null,
        'IsmailFormController- make sure you attached the form controller to a form');
    formKey.currentState!.reset();
  }

  void patchValue(Map<String, dynamic> val) {
    val.forEach((key, dynamic value) {
      _fields[key]?.didChange(value);
    });
  }

  @internal
  final formKey = GlobalKey<FormState>();
  final _fields = <String, IsmailFormFieldState>{};
  final _fieldsWithoutDisposed = <String, IsmailFormFieldState>{};
  final _value = <String, dynamic>{};
  final _inValidFields = <IsmailFormFieldState>[];
  bool _isValid = false;

  @internal
  void onFormChange(ValueChanged<Map<String, dynamic>>? onChanged) {
    assert(
      formKey.currentState != null,
      'IsmailFormController- make sure you attached the form controller to a form',
    );
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

  /// Value of the form
  Map<String, dynamic> get value => Map<String, dynamic>.unmodifiable(_value);

  /// all the fields that the [IsmailForm] showed even the disposed ones
  Map<String, dynamic> get fieldsWithoutDisposed =>
      Map<String, dynamic>.unmodifiable(_fieldsWithoutDisposed);

  /// all the fields that the [IsmailForm] this won't show the disposed ones
  Map<String, IsmailFormFieldState> get fields =>
      Map<String, IsmailFormFieldState>.unmodifiable(_fields);

  /// invalid fields of the form
  List<IsmailFormFieldState> get inValidFields =>
      List<IsmailFormFieldState>.unmodifiable(_inValidFields);
  bool get isValid => _isValid;
}
