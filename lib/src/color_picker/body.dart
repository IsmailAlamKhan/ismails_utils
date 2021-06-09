import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    Key? key,
    this.selectedColor,
    String? cancelText,
    String? confirmText,
    String? title,
  })  : cancelText = cancelText ?? 'Cancel',
        confirmText = confirmText ?? 'Confirm',
        title = title ?? 'Pick your color',
        super(key: key);
  final ColorPickerModel? selectedColor;
  final String cancelText;
  final String confirmText;
  final String title;
  Future<ColorPickerModel?> show(BuildContext context) =>
      showModalBottomSheet<ColorPickerModel?>(
        context: context,
        builder: (_) => this,
      );

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
    upperBound: double.infinity,
  );
  late final controller = ColorPickerControllerController(
    widget.selectedColor,
    animationController,
  );
  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();
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
                      Navigator.of(context).pop(controller.selectedColor);
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
            child: ColorShadePicker(controller: controller),
          ),
        ],
      ),
    );
  }
}
