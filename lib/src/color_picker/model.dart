import 'dart:ui';

import 'package:flutter/material.dart';
import '../src.dart';

class ColorPickerModel {
  final MaterialColor materialColor;
  final int shade;
  Color get color => materialColor[shade]!;
  ColorPickerModel({
    required this.materialColor,
    required this.shade,
  }) : assert(
          materialcolorShades.contains(shade),
          'The shade must contain in either of the color shades',
        );

  ColorPickerModel copyWith({
    MaterialColor? materialColor,
    int? shade,
  }) {
    return ColorPickerModel(
      materialColor: materialColor ?? this.materialColor,
      shade: shade ?? this.shade,
    );
  }

  @override
  String toString() =>
      'ColorPickerModel(materialColor: $materialColor, shade: $shade)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColorPickerModel &&
        other.materialColor == materialColor &&
        other.shade == shade;
  }

  @override
  int get hashCode => materialColor.hashCode ^ shade.hashCode;

  static const defaultblackMaterialColorValue = 0xFF000000;
  static const blackMaterialColor =
      MaterialColor(defaultblackMaterialColorValue, {
    50: Color(0xFFFFFFFF),
    100: Color(0xFFF3F3F3),
    200: Color(0xFFEFEFEF),
    300: Color(0xFFD9D9D9),
    400: Color(0xFFCCCCCC),
    500: Color(0xFFB7B7B7),
    600: Color(0xFF999999),
    700: Color(0xFF666666),
    800: Color(0xFF434343),
    900: Color(defaultblackMaterialColorValue),
  });

  static const colorList = [
    blackMaterialColor,
    Colors.brown,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lime,
    Colors.lightBlue,
    Colors.blue,
    Colors.purple,
    Colors.pink,
  ];
}
