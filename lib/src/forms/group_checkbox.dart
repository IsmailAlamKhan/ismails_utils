import 'package:flutter/material.dart';
import '../src.dart';

/// A list of Checkboxes for selecting multiple options
class IsmailCheckboxGroupFormField<T> extends IsmailFormField<List<T>> {
  final List<IsmailFormFieldOption<T>> options;
  final Color? activeColor;
  final Color? checkColor;
  final Color? focusColor;
  final Color? hoverColor;
  final List<T>? disabled;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool tristate;
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

  /// Creates a list of Checkboxes for selecting multiple options
  IsmailCheckboxGroupFormField({
    Key? key,
    //From Super
    required String name,
    FormFieldValidator<List<T>>? validator,
    List<T>? initialValue,
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<List<T>?>? onChanged,
    ValueTransformer<List<T>>? valueTransformer,
    bool enabled = true,
    FormFieldSetter<List<T>>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    VoidCallback? onReset,
    FocusNode? focusNode,
    required this.options,
    this.activeColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.disabled,
    this.materialTapTargetSize,
    this.tristate = false,
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
          decoration: decoration,
          focusNode: focusNode,
          builder: (FormFieldState<List<T>?> field) {
            final state = field as _IsmailCheckboxGroupFormFieldState<T>;

            return InputDecorator(
              decoration: state.decoration,
              child: IsmailGroupedCheckbox<T>(
                value: state.value,
                options: options,
                onChanged: (val) {
                  state.requestFocus();
                  field.didChange(val);
                },
                disabled: state.enabled
                    ? disabled
                    : options.map((e) => e.value).toList(),
                activeColor: activeColor,
                focusColor: focusColor,
                checkColor: checkColor,
                materialTapTargetSize: materialTapTargetSize,
                hoverColor: hoverColor,
                tristate: tristate,
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
  _IsmailCheckboxGroupFormFieldState<T> createState() =>
      _IsmailCheckboxGroupFormFieldState<T>();
}

class _IsmailCheckboxGroupFormFieldState<T>
    extends IsmailFormFieldState<IsmailCheckboxGroupFormField<T>, List<T>> {}
