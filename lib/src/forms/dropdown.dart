import 'package:flutter/material.dart';

import '../src.dart';

class CustomDropdownFormField<T> extends DropdownButtonFormField<T> {
  final List<IsmailFormFieldItem<T>> options;

  CustomDropdownFormField({
    required this.options,
    FormFieldValidator<T?>? validator,
    InputDecoration? decoration,
    ValueChanged<T?>? onChanged,
  }) : super(
          validator: validator,
          onChanged: onChanged,
          decoration: decoration,
          items: options
              .map(
                (e) => DropdownMenuItem<T>(
                  value: e.value,
                  child: e,
                ),
              )
              .toList(),
        );
}
