import 'package:flutter/material.dart';
import 'model.dart';

class IsmailCarouselIndicator extends StatelessWidget {
  const IsmailCarouselIndicator({
    Key? key,
    required this.isActive,
    required this.customizer,
  }) : super(key: key);
  final bool isActive;
  final IsmailCarouselIndicatorCustomizer customizer;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: customizer.animationDuration,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: customizer.height,
      width: isActive ? customizer.activeWidth : customizer.width,
      decoration: BoxDecoration(
        color: isActive ? customizer.activeColor : customizer.inActiveColor,
        borderRadius: customizer.borderRadius,
      ),
    );
  }
}
