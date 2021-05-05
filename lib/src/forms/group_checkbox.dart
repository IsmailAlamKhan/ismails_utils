import 'package:flutter/material.dart';
import '../src.dart';

class IsmailGroupCheckboxFormField<T> extends IsmailFormField<List<T>> {
  final List<IsmailFormFieldItem<T>> options;

  final ControlAffinity controlAffinity;

  IsmailGroupCheckboxFormField({
    Key? key,
    required String name,
    required this.options,
    ValueChanged<List<T>?>? onChanged,
    this.controlAffinity = ControlAffinity.leading,
    FormFieldValidator<List<T>>? validator,
    InputDecoration decoration = const InputDecoration(),
    bool enabled = true,
    List<T>? initialValue,
    AutovalidateMode? autovalidateMode,
    FocusNode? focusNode,
    VoidCallback? onReset,
    FormFieldSetter<List<T>?>? onSaved,
    ValueTransformer<List<T>>? valueTransformer,
  }) : super(
            valueTransformer: valueTransformer,
            key: key,
            onSaved: onSaved,
            onReset: onReset,
            enabled: enabled,
            focusNode: focusNode,
            autovalidateMode: autovalidateMode,
            validator: validator,
            name: name,
            decoration: decoration,
            onChanged: onChanged,
            initialValue: initialValue,
            builder: (state) {
              final field = state as _GroupCheckboxFormFieldState<T>;
              return InputDecorator(
                decoration: state.decoration,
                isFocused: field.focusNode.hasFocus,
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
