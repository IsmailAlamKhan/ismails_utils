import 'package:flutter/material.dart';

class FormFieldItem<T> extends StatelessWidget {
  const FormFieldItem({
    Key? key,
    required this.value,
    this.child,
    this.text,
  }) : super(key: key);
  final T value;
  final Widget? child;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return child ?? Text(text ?? value.toString());
  }
}
