import 'package:flutter/material.dart';

import '../src.dart';

/// Field to select one value from a list of Radio Widgets
class IsmailRadioGroupFormField<T> extends IsmailFormField<T> {
  final List<IsmailFormFieldOption<T>> options;
  final Color? activeColor;
  final Color? focusColor;
  final Color? hoverColor;
  final List<T>? disabled;
  final MaterialTapTargetSize? materialTapTargetSize;
  final Axis wrapDirection;
  final WrapAlignment wrapAlignment;
  final double wrapSpacing;
  final WrapAlignment wrapRunAlignment;
  final double wrapRunSpacing;
  final WrapCrossAlignment wrapCrossAxisAlignment;
  final TextDirection? wrapTextDirection;
  final VerticalDirection wrapVerticalDirection;
  final Widget? separator;
  final ControlAffinity controlAffinity;

  /// Creates field to select one value from a list of Radio Widgets
  IsmailRadioGroupFormField({
    Key? key,
    //From Super
    required String name,
    FormFieldValidator<T>? validator,
    T? initialValue,
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<T?>? onChanged,
    ValueTransformer<T>? valueTransformer,
    bool enabled = true,
    FormFieldSetter<T>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    VoidCallback? onReset,
    FocusNode? focusNode,
    required this.options,
    this.activeColor,
    this.focusColor,
    this.hoverColor,
    this.disabled,
    this.materialTapTargetSize,
    this.wrapDirection = Axis.horizontal,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapSpacing = 0.0,
    this.wrapRunAlignment = WrapAlignment.start,
    this.wrapRunSpacing = 0.0,
    this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
    this.wrapTextDirection,
    this.wrapVerticalDirection = VerticalDirection.down,
    this.separator,
    this.controlAffinity = ControlAffinity.leading,
    bool wantClearIcon = false,
    Widget? clearIcon,
  }) : super(
          clearIcon: clearIcon,
          wantClearIcon: wantClearIcon,
          key: key,
          initialValue: initialValue,
          name: name,
          validator: validator,
          valueTransformer: valueTransformer,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          enabled: enabled,
          onReset: onReset,
          focusNode: focusNode,
          decoration: decoration,
          builder: (FormFieldState<T?> field) {
            final state = field as _IsmailRadioGroupFormFieldState<T>;

            return InputDecorator(
              decoration: state.decoration,
              child: IsmailGroupedRadio<T>(
                value: state.value,
                options: options,
                onChanged: (val) {
                  state.requestFocus();
                  state.didChange(val);
                },
                disabled: state.enabled
                    ? disabled
                    : options.map((e) => e.value).toList(),
                activeColor: activeColor,
                focusColor: focusColor,
                materialTapTargetSize: materialTapTargetSize,
                hoverColor: hoverColor,
                wrapAlignment: wrapAlignment,
                wrapCrossAxisAlignment: wrapCrossAxisAlignment,
                wrapDirection: wrapDirection,
                wrapRunAlignment: wrapRunAlignment,
                wrapRunSpacing: wrapRunSpacing,
                wrapSpacing: wrapSpacing,
                wrapTextDirection: wrapTextDirection,
                wrapVerticalDirection: wrapVerticalDirection,
                separator: separator,
                controlAffinity: controlAffinity,
              ),
            );
          },
        );

  @override
  _IsmailRadioGroupFormFieldState<T> createState() =>
      _IsmailRadioGroupFormFieldState<T>();
}

class _IsmailRadioGroupFormFieldState<T>
    extends IsmailFormFieldState<IsmailRadioGroupFormField<T>, T> {}
