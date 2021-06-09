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
}
