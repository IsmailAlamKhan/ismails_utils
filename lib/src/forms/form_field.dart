import 'package:flutter/material.dart';
import '../src.dart';

class IsmailFormField<T> extends FormField<T?> {
  final String name;
  final FormFieldSetter<T>? onChanged;
  final VoidCallback? onReset;
  final InputDecoration decoration;
  final FocusNode? focusNode;
  final ValueTransformer<T>? valueTransformer;
  final bool wantClearIcon;
  final Widget? clearIcon;

  const IsmailFormField({
    Key? key,
    required this.name,
    this.wantClearIcon = false,
    this.clearIcon,
    this.focusNode,
    this.valueTransformer,
    this.onReset,
    this.onChanged,
    this.decoration = const InputDecoration(),
    FormFieldSetter<T>? onSaved,
    T? initialValue,
    AutovalidateMode? autovalidateMode,
    bool enabled = true,
    FormFieldValidator<T>? validator,
    required FormFieldBuilder<T?> builder,
  }) : super(
          key: key,
          initialValue: initialValue,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
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

  FocusNode get focusNode => _focusNode;
  IsmailFormState? _ismailFormState;

  @override
  F get widget => super.widget as F;
  String get name => widget.name;

  @override
  bool get hasError => super.hasError || widget.decoration.errorText != null;
  @override
  bool get isValid => super.isValid && widget.decoration.errorText == null;

  bool get enabled => widget.enabled && (_ismailFormState?.enabled ?? true);

  bool _touched = false;

  T? get initialValue {
    final _formInitVal = (_ismailFormState?.initialValue ??
        const <String, dynamic>{})[widget.name];
    if (_formInitVal is! T) {
      if (_formInitVal != null) {
        ismailFormLog.warning(
          'Warning the initial Value you passed ${_formInitVal.runtimeType}'
          ' is not the same type as the field',
        );
      }
      return widget.initialValue;
    } else {
      return widget.initialValue ?? _formInitVal;
    }
  }

  void unregisterField() {
    _ismailFormState?.unregisterField(widget.name, this);
  }

  @override
  void initState() {
    super.initState();
    _ismailFormState = IsmailForm.of(context);
    _ismailFormState?.registerField(widget.name, this);
    _focusNode.addListener(_touchedHandler);
    setValue(initialValue);
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

  Widget get clearIcon => IconButton(
        icon: widget.clearIcon ?? const Icon(Icons.clear),
        onPressed: () {
          didChange(null);
        },
      );

  Widget? get _suffixIcon {
    if (widget.decoration.suffixIcon != null) {
      if (!widget.wantClearIcon) {
        return widget.decoration.suffixIcon!;
      } else {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.decoration.suffixIcon!,
            clearIcon,
          ],
        );
      }
    } else {
      return !widget.wantClearIcon ? null : clearIcon;
    }
  }

  InputDecoration get decoration => widget.decoration.copyWith(
        errorText: widget.decoration.errorText ?? errorText,
        suffixIcon: _suffixIcon,
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

  @override
  void save() {
    super.save();
    if (_ismailFormState != null) {
      if (enabled || !_ismailFormState!.widget.skipDisabled) {
        _ismailFormState!.setInternalFieldValue(
          widget.name,
          null != widget.valueTransformer
              ? widget.valueTransformer!(value)
              : value,
        );
      } else {
        _ismailFormState!.removeInternalFieldValue(widget.name);
      }
    }
  }
}
