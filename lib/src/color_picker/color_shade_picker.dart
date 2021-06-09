import 'package:flutter/material.dart';

import '../src.dart';

class ColorShadePicker extends StatelessWidget {
  const ColorShadePicker({
    Key? key,
    required this.controller,
    required this.transitionDuration,
    required this.transitionCurve,
  }) : super(key: key);
  final ColorPickerControllerController controller;

  final Duration transitionDuration;
  final Curve transitionCurve;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var item in materialcolorShades) _build(item),
      ],
    );
  }

  Widget _build(int shade) {
    return ResponsiveBuilder(
      builder: (_, screenUtil, child, ___) {
        return SizedBox(
          width: 50 * screenUtil.pixelRatio,
          height: 50,
          child: child,
        );
      },
      child: ValueListenableBuilder<ColorPickerModel>(
        valueListenable: controller.selectedColorNotifier,
        builder: (_, color, __) {
          final active = color.shade == shade;
          return AnimatedCard(
            curve: transitionCurve,
            duration: transitionDuration,
            color: color.materialColor[shade],
            margin: const EdgeInsets.all(5),
            clipBehavior: Clip.antiAlias,
            child: Center(
              child: InkWell(
                onTap: () {
                  controller.selectShade(shade);
                },
                child: !active
                    ? null
                    : const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            backgroundColor: Colors.white60,
                            radius: 10,
                            child: Icon(
                              Icons.check,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
