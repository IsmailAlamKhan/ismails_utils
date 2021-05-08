import 'package:flutter/material.dart';

class IsmailFormFieldOption<T> extends StatelessWidget {
  const IsmailFormFieldOption({
    Key? key,
    required this.value,
    this.child,
    this.text,
  }) : super(key: key);
  final T value;
  final Widget? child;
  final String? text;
  IsmailFormFieldOption.fromJson(Map<String, dynamic> map)
      : value = map['value'],
        child = null,
        text = map['text'] ?? map['Text'];
  @override
  Widget build(BuildContext context) {
    return child ?? Text(text ?? value.toString());
  }
}
