import 'package:flutter/material.dart';

/// {@template IsmailFormFieldOption}
/// [IsmailFormFieldOption] that is used by the radiogroup,checkboxgroup and manyother
/// {@endtemplate}
class IsmailFormFieldOption<T> extends StatelessWidget {
  /// {@macro IsmailFormFieldOption}
  const IsmailFormFieldOption({
    Key? key,
    required this.value,
    this.child,
    this.text,
  }) : super(key: key);

  /// Value of the option
  final T value;

  /// widget to return its not required the widget will return the
  /// value.toString() or [IsmailFormFieldOption.text]
  final Widget? child;

  /// text to return its not required the widget will return the
  /// value.toString() or [IsmailFormFieldOption.child]
  final String? text;

  /// get [IsmailFormFieldOption] from json
  IsmailFormFieldOption.fromJson(Map<String, dynamic> map)
      : value = map['value'],
        child = null,
        text = map['text'] ?? map['Text'];
  @override
  Widget build(BuildContext context) {
    return child ?? Text(text ?? value.toString());
  }
}
