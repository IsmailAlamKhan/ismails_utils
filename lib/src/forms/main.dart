import 'package:flutter/material.dart';

import '../src.dart';

class IsmailForm extends StatefulWidget {
  const IsmailForm({
    Key? key,
    required this.child,
    this.enabled = true,
    this.initialValue = const <String, dynamic>{},
    this.onChanged,
    this.autovalidateMode,
    this.onWillPop,
    this.skipDisabled = true,
    this.controller,
  }) : super(key: key);

  final Widget child;
  final bool enabled;

  /// InitialValue of the form
  final Map<String, dynamic> initialValue;
  final ValueChanged<Map<String, dynamic>>? onChanged;
  final AutovalidateMode? autovalidateMode;
  final WillPopCallback? onWillPop;
  final bool skipDisabled;

  /// an [IsmailFormController] which you can listen to
  final IsmailFormController? controller;

  @override
  IsmailFormState createState() => IsmailFormState();

  /// get [IsmailFormState] if there is an [IsmailForm] anccestor
  static IsmailFormState? of(BuildContext context) =>
      context.findAncestorStateOfType<IsmailFormState>();
}

class IsmailFormState extends State<IsmailForm> {
  late final IsmailFormController controller =
      widget.controller ?? IsmailFormController();

  /// initial value of the form
  Map<String, dynamic> get initialValue {
    return widget.initialValue;
  }

  bool get enabled => widget.enabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      autovalidateMode: widget.autovalidateMode,
      onWillPop: widget.onWillPop,
      onChanged: () => controller.onFormChange(widget.onChanged),
      child: FocusTraversalGroup(
        policy: WidgetOrderTraversalPolicy(),
        child: widget.child,
      ),
    );
  }
}
