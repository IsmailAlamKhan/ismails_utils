import 'package:flutter/material.dart';

import '../src.dart';

class MaterialColorPicker extends StatelessWidget {
  const MaterialColorPicker({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ColorPickerControllerController controller;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, screenUtil, ___, ____) => SizedBox(
        height: 60,
        width: screenUtil.width,
        child: Stack(
          children: [
            Positioned(
              left: 5,
              right: 5,
              height: 30,
              child: Row(
                children: [
                  for (var i = 0; i < controller.colors.length; i++)
                    MaterialColorCard(
                      key: controller.keys[i],
                      sizeChanged: controller.sizeChanged,
                      color: controller.colors[i],
                      onTap: controller.selectMaterialColor,
                    ),
                ],
              ),
            ),
            ColorPickerSlider(
              onDragEnd: controller.onDragEnd,
              onDragUpdate: controller.onDragUpdate,
              positionNotifier: controller.positionNotifier,
              sizeNotifier: controller.sizeNotifier,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomBoxShadow extends BoxShadow {
  final BlurStyle blurStyle;

  const _CustomBoxShadow({
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    this.blurStyle = BlurStyle.normal,
  }) : super(color: color, offset: offset, blurRadius: blurRadius);

  @override
  Paint toPaint() {
    final Paint result = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(blurStyle, blurSigma);
    assert(() {
      if (debugDisableShadows) result.maskFilter = null;
      return true;
    }());
    return result;
  }
}

class ColorPickerSlider extends StatelessWidget {
  const ColorPickerSlider({
    Key? key,
    required this.positionNotifier,
    required this.sizeNotifier,
    required this.onDragEnd,
    required this.onDragUpdate,
  }) : super(key: key);
  final ValueNotifier<Offset> positionNotifier;
  final ValueNotifier<Size> sizeNotifier;
  final GestureDragEndCallback onDragEnd;
  final GestureDragUpdateCallback onDragUpdate;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ValueListenableBuilder<Offset>(
      valueListenable: positionNotifier,
      builder: (_, postion, child) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          left: postion.dx,
          top: -2,
          child: child!,
        );
      },
      child: ValueListenableBuilder<Size>(
        valueListenable: sizeNotifier,
        builder: (_, size, __) {
          return GestureDetector(
            onHorizontalDragEnd: onDragEnd,
            onHorizontalDragUpdate: onDragUpdate,
            child: Container(
              height: size.height + 10,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: theme.scaffoldBackgroundColor,
                  width: 5,
                ),
                boxShadow: const [
                  _CustomBoxShadow(
                    blurRadius: 5.0,
                    blurStyle: BlurStyle.outer,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MaterialColorCard extends StatelessWidget {
  const MaterialColorCard({
    Key? key,
    required this.color,
    required this.onTap,
    required this.sizeChanged,
  }) : super(key: key);
  final MaterialColor color;
  final ValueChanged<MaterialColor> onTap;
  final ValueChanged<Size> sizeChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedCard(
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        color: color,
        margin: EdgeInsets.zero,
        child: WidgetSizeNotifier(
          onChange: sizeChanged,
          child: SizedBox.expand(
            child: InkWell(
              onTap: () => onTap(color),
            ),
          ),
        ),
      ),
    );
  }
}
