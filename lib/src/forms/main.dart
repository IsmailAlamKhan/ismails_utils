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

  //* values, methods taken from the controller
  //* ----------------------------------------
  Map<String, dynamic> get value => controller.value;
  Map<String, IsmailFormFieldState> get fields => controller.fields;
  List<IsmailFormFieldState> get inValidFields => controller.inValidFields;
  bool get isValid => controller.isValid;
  void setInternalFieldValue(String name, dynamic value) =>
      controller.setInternalFieldValue(name, value);
  void removeInternalFieldValue(String name) =>
      controller.removeInternalFieldValue(name);
  void registerField(String name, IsmailFormFieldState field) =>
      controller.registerField(name, field);
  void unregisterField(String name, IsmailFormFieldState field) =>
      controller.unregisterField(name, field);
  void save() => controller.save();
  bool validate() => controller.validate();
  bool saveAndValidate() => controller.saveAndValidate();
  void patchValue(Map<String, dynamic> val) => controller.patchValue(val);
  //* -----------------------------------------

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
