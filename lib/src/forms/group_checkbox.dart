import 'package:flutter/material.dart';
import '../src.dart';

class GroupCheckboxFormField<T> extends FormField<List<T>> {
  final List<IsmailFormFieldItem<T>> options;
  final ValueChanged<List<T>> onChanged;
  final ControlAffinity controlAffinity;
  final InputDecoration? decoration;

  @override
  final bool enabled;
  @override
  final FormFieldValidator<List<T>>? validator;
  GroupCheckboxFormField({
    required this.options,
    required this.onChanged,
    this.controlAffinity = ControlAffinity.leading,
    this.validator,
    this.decoration,
    this.enabled = true,
    List<T>? initialValue,
  }) : super(
          initialValue: initialValue,
          builder: (field) => InputDecorator(
            decoration: decoration?.copyWith(
                  errorText: field.errorText,
                ) ??
                InputDecoration(
                  errorText: field.errorText,
                ),
            child: GroupCheckBox<T>(
              controlAffinity: controlAffinity,
              onChanged: field.didChange,
              options: options,
              value: field.value,
            ),
          ),
        );
}
