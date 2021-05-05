import 'package:flutter/material.dart';

import '../src.dart';

class IsmailGroupRadioFormField<T> extends IsmailFormField<T> {
  final List<IsmailFormFieldItem<T>> options;

  final ControlAffinity controlAffinity;

  @override
  final FormFieldValidator<T>? validator;
  @override
  final bool enabled;

  IsmailGroupRadioFormField({
    required String name,
    required this.options,
    ValueChanged<T?>? onChanged,
    this.controlAffinity = ControlAffinity.leading,
    InputDecoration decoration = const InputDecoration(),
    this.validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    this.enabled = true,
    T? initialValue,
  }) : super(
          name: name,
          decoration: decoration,
          onChanged: onChanged,
          initialValue: initialValue,
          autovalidateMode: autovalidateMode,
          builder: (state) {
            final field = state as _GroupRadioFormFieldState<T>;
            return InputDecorator(
              decoration: field.decoration,
              child: IsmailGroupRadio<T>(
                controlAffinity: controlAffinity,
                onChanged: field.didChange,
                options: options,
                value: field.value,
              ),
            );
          },
        );
  @override
  _GroupRadioFormFieldState<T> createState() => _GroupRadioFormFieldState<T>();
}

class _GroupRadioFormFieldState<T>
    extends IsmailFormFieldState<IsmailGroupRadioFormField<T>, T> {}
