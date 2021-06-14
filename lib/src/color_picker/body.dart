import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    Key? key,
    String? confirmText,
    String? title,
    this.selectedColor,
    this.onConfirm,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.transitionCurve = Curves.easeInExpo,
  })  : confirmText = confirmText ?? 'Confirm',
        title = title ?? 'Pick your color',
        super(key: key);
  final ColorPickerModel? selectedColor;
  final String confirmText;
  final String title;
  final Duration transitionDuration;
  final Curve transitionCurve;
  final ValueChanged<ColorPickerModel?>? onConfirm;
  Future<ColorPickerModel?> show(BuildContext context) =>
      showModalBottomSheet<ColorPickerModel?>(
        context: context,
        builder: (_) => ColorPicker(
          onConfirm: Navigator.of(context).pop,
          confirmText: confirmText,
          key: key,
          selectedColor: selectedColor,
          title: title,
          transitionCurve: transitionCurve,
          transitionDuration: transitionDuration,
        ),
      );

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late final ColorPickerControllerController controller =
      ColorPickerControllerController(
    selectedColorFromParent: widget.selectedColor,
    transitionCurve: widget.transitionCurve,
    transitionDuration: widget.transitionDuration,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Text(widget.title, style: theme.textTheme.headline6),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      widget.onConfirm?.call(controller.selectedColor);
                      // Navigator.of(context).pop(controller.selectedColor);
                    },
                    child: Text(widget.confirmText),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          MaterialColorPicker(controller: controller),
          Align(
            alignment: Alignment.centerLeft,
            child: ColorShadePicker(
              controller: controller,
              transitionCurve: widget.transitionCurve,
              transitionDuration: widget.transitionDuration,
            ),
          ),
        ],
      ),
    );
  }
}
