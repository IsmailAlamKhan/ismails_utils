import 'package:flutter/material.dart';

import '../src.dart';

class IsmailDropdownButtonFormField<T> extends IsmailFormField<T> {
  IsmailDropdownButtonFormField({
    required String name,
    required List<IsmailFormFieldItem<T>> options,
    FormFieldValidator<T?>? validator,
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<T?>? onChanged,
  }) : super(
          name: name,
          validator: validator,
          onChanged: onChanged,
          decoration: decoration,
          builder: (state) {
            final field = state as _IsmailDropdownButtonFormFieldState<T>;
            return InputDecorator(
              decoration: field.decoration,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: field.value,
                  onChanged: field.didChange,
                  items: options
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.value,
                          child: e,
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          },
        );

  @override
  _IsmailDropdownButtonFormFieldState<T> createState() =>
      _IsmailDropdownButtonFormFieldState<T>();
}

class _IsmailDropdownButtonFormFieldState<T>
    extends IsmailFormFieldState<IsmailDropdownButtonFormField<T>, T> {}
