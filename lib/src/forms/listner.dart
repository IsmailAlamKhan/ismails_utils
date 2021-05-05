import 'dart:async';
import 'package:flutter/material.dart';

import '../src.dart';

class IsmailFormChangeListner extends StatelessWidget {
  const IsmailFormChangeListner({
    Key? key,
    this.child,
    required this.builder,
  }) : super(key: key);
  final Widget? child;
  final Widget Function(
    BuildContext context,
    Widget? child,
    IsmailFormState form,
  ) builder;

  @override
  Widget build(BuildContext context) {
    final form = IsmailForm.of(context);
    assert(
      form != null,
      'Make sure to put IsmailFormValidListner as descendent of IsmailForm',
    );
    return StreamBuilder<String>(
      stream: form!.valueChanged,
      initialData: '',
      builder: (context, snapshot) {
        return builder(context, child, form);
      },
    );
  }
}
