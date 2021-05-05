import 'package:flutter/material.dart';

import '../src.dart';

class IsmailDropdownButtonFormField<T> extends IsmailFormField<T> {
  IsmailDropdownButtonFormField({
    Key? key,
    required String name,
    required List<IsmailFormFieldItem<T>> options,
    FormFieldValidator<T?>? validator,
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<T?>? onChanged,
    AutovalidateMode? autovalidateMode,
    bool enabled = true,
    FocusNode? focusNode,
    T? initialValue,
    VoidCallback? onReset,
    FormFieldSetter<T>? onSaved,
    ValueTransformer<T>? valueTransformer,
  }) : super(
          valueTransformer: valueTransformer,
          key: key,
          onReset: onReset,
          onSaved: onSaved,
          enabled: enabled,
          focusNode: focusNode,
          initialValue: initialValue,
          autovalidateMode: autovalidateMode,
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
                  isDense: field.decoration.isDense ?? false,
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
