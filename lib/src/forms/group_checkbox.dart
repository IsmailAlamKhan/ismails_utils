import 'package:flutter/material.dart';
import '../src.dart';

class IsmailGroupCheckboxFormField<T> extends IsmailFormField<List<T>> {
  final List<IsmailFormFieldItem<T>> options;

  final ControlAffinity controlAffinity;
  @override
  final bool enabled;
  @override
  final FormFieldValidator<List<T>>? validator;

  IsmailGroupCheckboxFormField({
    required String name,
    required this.options,
    ValueChanged<List<T>?>? onChanged,
    this.controlAffinity = ControlAffinity.leading,
    this.validator,
    InputDecoration decoration = const InputDecoration(),
    this.enabled = true,
    List<T>? initialValue,
  }) : super(
            name: name,
            decoration: decoration,
            onChanged: onChanged,
            initialValue: initialValue,
            builder: (state) {
              final field = state as _GroupCheckboxFormFieldState<T>;
              return InputDecorator(
                decoration: state.decoration,
                child: IsmailGroupCheckBox<T>(
                  controlAffinity: controlAffinity,
                  onChanged: field.didChange,
                  options: options,
                  value: field.value,
                ),
              );
            });
  @override
  _GroupCheckboxFormFieldState<T> createState() =>
      _GroupCheckboxFormFieldState<T>();
}

class _GroupCheckboxFormFieldState<T>
    extends IsmailFormFieldState<IsmailGroupCheckboxFormField<T>, List<T>> {}
