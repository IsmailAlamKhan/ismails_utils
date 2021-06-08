import 'package:flutter/material.dart';

import '../src.dart';

class MaterialColorPicker extends StatefulWidget {
  const MaterialColorPicker({
    Key? key,
    this.selectedColor,
    String? cancelText,
    String? confirmText,
    String? title,
  })  : cancelText = cancelText ?? 'Cancel',
        confirmText = confirmText ?? 'Confirm',
        title = title ?? 'Pick your color',
        super(key: key);
  final Color? selectedColor;
  final String cancelText;
  final String confirmText;
  final String title;
  @override
  _MaterialColorPickerState createState() => _MaterialColorPickerState();
}

class _MaterialColorPickerState extends State<MaterialColorPicker> {
  late final ValueNotifier<Color> _selectedColor =
      ValueNotifier(Colors.primaries[0]);
  @override
  void initState() {
    super.initState();
    if (widget.selectedColor != null) {
      _selectedColor.value = widget.selectedColor!;
    }
  }

  late final colors = Colors.primaries;
  late final colorShades = const {
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Wrap(
        children: [
          for (var color in colors)
            _Color(color: color, selectedColor: _selectedColor)
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(_selectedColor.value),
          child: Text(widget.confirmText),
        ),
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text(widget.cancelText),
        ),
      ],
      content: Wrap(
        runSpacing: 5,
        spacing: 5,
        children: [
          for (var color in colorShades)
            ValueListenableBuilder<Color>(
              valueListenable: _selectedColor,
              builder: (context, val, child) {
                final value = val as MaterialColor;
                LoggerService().info(value);
                LoggerService().info(value[100]);

                return SizedBox(
                  height: 50,
                  width: 100,
                  child: AnimatedCard(
                    color: value[color],
                    child: InkWell(
                      onTap: () {},
                      child: Stack(
                        children: const [
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: Icon(Icons.check_circle),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _Color extends StatelessWidget {
  const _Color({
    Key? key,
    required this.color,
    required this.selectedColor,
  }) : super(key: key);

  final Color color;
  final ValueNotifier<Color> selectedColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Material(
        color: color,
        elevation: 6,
        clipBehavior: Clip.antiAlias,
        child: ValueListenableBuilder<Color>(
          valueListenable: selectedColor,
          builder: (context, value, child) {
            if (value == color) {
              return const Icon(Icons.check);
            }
            return InkWell(
              onTap: () => selectedColor.value = color,
            );
          },
        ),
      ),
    );
  }
}
