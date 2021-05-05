import 'package:flutter/material.dart';

import '../src.dart';

class IsmailGroupRadioFormField<T> extends IsmailFormField<T> {
  final List<IsmailFormFieldItem<T>> options;

  final ControlAffinity controlAffinity;

  IsmailGroupRadioFormField({
    Key? key,
    required String name,
    required this.options,
    ValueChanged<T?>? onChanged,
    this.controlAffinity = ControlAffinity.leading,
    InputDecoration decoration = const InputDecoration(),
    FormFieldValidator<T>? validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    bool enabled = true,
    T? initialValue,
    FocusNode? focusNode,
    VoidCallback? onReset,
    FormFieldSetter<T>? onSaved,
    ValueTransformer<T>? valueTransformer,
  }) : super(
          onReset: onReset,
          onSaved: onSaved,
          validator: validator,
          valueTransformer: valueTransformer,
          key: key,
          focusNode: focusNode,
          enabled: enabled,
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
