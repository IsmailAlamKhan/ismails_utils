import 'package:flutter/material.dart';

class IsmailForm extends StatefulWidget {
  const IsmailForm({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  IsmailFormState createState() => IsmailFormState();

  IsmailFormState? of(BuildContext context) =>
      context.findAncestorStateOfType<IsmailFormState>();
}

class IsmailFormState extends State<IsmailForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: widget.child,
    );
  }
}
