import 'package:flutter/material.dart';
import '../src.dart';

class IsmailFormField<T> extends FormField<T?> {
  final String name;
  final FormFieldSetter<T>? onChanged;
  final VoidCallback? onReset;
  final InputDecoration decoration;
  final FocusNode? focusNode;

  const IsmailFormField({
    Key? key,
    required this.name,
    this.focusNode,
    this.onReset,
    this.onChanged,
    this.decoration = const InputDecoration(),
    FormFieldSetter<T>? onSaved,
    T? initialValue,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    bool enabled = true,
    FormFieldValidator<T>? validator,
    required FormFieldBuilder<T?> builder,
  }) : super(
          key: key,
          initialValue: initialValue,
          autovalidateMode: autovalidateMode,
          builder: builder,
          onSaved: onSaved,
          validator: validator,
          enabled: enabled,
        );

  @override
  IsmailFormFieldState<IsmailFormField<T>, T?> createState() =>
      IsmailFormFieldState<IsmailFormField<T>, T?>();
}

class IsmailFormFieldState<F extends IsmailFormField<T?>, T>
    extends FormFieldState<T?> {
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();

  FocusNode? get focusNode => _focusNode;
  IsmailFormState? _ismailFormState;

  @override
  F get widget => super.widget as F;

  @override
  bool get hasError => super.hasError || widget.decoration.errorText != null;
  @override
  bool get isValid => super.isValid && widget.decoration.errorText == null;
  bool _touched = false;
  late final _formInitVal = (_ismailFormState?.initialValue ??
      const <String, dynamic>{})[widget.name] as T?;
  T? get initialValue {
    debugPrint(_ismailFormState?.initialValue[widget.name].toString());
    return widget.initialValue ?? _formInitVal;
  }

  @override
  void initState() {
    super.initState();
    _ismailFormState = IsmailForm.of(context);
    _ismailFormState?.registerField(widget.name, this);
    _focusNode.addListener(_touchedHandler);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_touchedHandler);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _ismailFormState?.unregisterField(widget.name, this);
    super.dispose();
  }

  void _touchedHandler() {
    if (_focusNode.hasFocus && _touched == false) {
      setState(() => _touched = true);
    }
  }

  @override
  bool validate() {
    return super.validate() && widget.decoration.errorText == null;
  }

  void requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  InputDecoration get decoration => widget.decoration.copyWith(
        errorText: widget.decoration.errorText ?? errorText,
      );
  @override
  void didChange(T? val) {
    super.didChange(val);
    widget.onChanged?.call(value);
  }

  @override
  void reset() {
    super.reset();
    setValue(initialValue);
    widget.onReset?.call();
  }
}
