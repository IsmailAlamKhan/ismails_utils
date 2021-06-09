import 'package:flutter/material.dart';

import '../src.dart';

const _defaultBlackValue = 0xFF000000;
const _blackColor = MaterialColor(_defaultBlackValue, {
  50: Color(0xFFFFFFFF),
  100: Color(0xFFF3F3F3),
  200: Color(0xFFEFEFEF),
  300: Color(0xFFD9D9D9),
  400: Color(0xFFCCCCCC),
  500: Color(0xFFB7B7B7),
  600: Color(0xFF999999),
  700: Color(0xFF666666),
  800: Color(0xFF434343),
  900: Color(_defaultBlackValue),
});

const _colorList = [
  _blackColor,
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

class ColorPickerControllerController {
  final ColorPickerModel? selectedColorFromParent;
  ColorPickerControllerController(this.selectedColorFromParent) {
    init();
  }

  final colors = _colorList;
  late final List<GlobalKey> keys;
  late final ValueNotifier<ColorPickerModel> selectedColorNotifier =
      ValueNotifier<ColorPickerModel>(
    selectedColorFromParent ??
        ColorPickerModel(materialColor: colors[0], shade: defaultColorShade),
  );

  ColorPickerModel get selectedColor => selectedColorNotifier.value;
  late final sizeNotifier = ValueNotifier<Size>(Size.zero);
  late final positionNotifier = ValueNotifier<Offset>(Offset.zero);
  void setPostion() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final index = colors.indexOf(selectedColorNotifier.value.materialColor);
      positionNotifier.value = calculatePosition(index);
    });
  }

  void init() {
    keys = List.generate(colors.length, (index) => GlobalKey());
    selectedColorNotifier.addListener(setPostion);
    sizeNotifier.addListener(setPostion);
    if (selectedColorFromParent != null) {
      selectedColorNotifier.value = selectedColorFromParent!;
    }
    setPostion();
  }

  void onDragEnd(DragEndDetails details) {
    final lowestPostion = calculatePosition(0);
    final higestPostion = calculatePosition(colors.length - 1);
    if (positionNotifier.value.dx < lowestPostion.dx) {
      positionNotifier.value = lowestPostion;
    } else if (positionNotifier.value.dx > higestPostion.dx) {
      positionNotifier.value = higestPostion;
    }
    final currentPostion = positionNotifier.value;
    final tileSize = sizeNotifier.value.width;
    final _index = currentPostion.dx / tileSize;
    if (_index.isFinite) {
      final index = _index.round();
      LoggerService().info(index);
      selectedColorNotifier.value = selectedColorNotifier.value.copyWith(
        materialColor: colors.elementAt(index),
      );
    }
  }

  void onDragUpdate(DragUpdateDetails details) =>
      positionNotifier.value = details.globalPosition;

  void dispose() {
    sizeNotifier.dispose();
    selectedColorNotifier.dispose();
    positionNotifier.dispose();
  }

  Offset calculatePosition(int index) {
    final key = keys[index];
    final renderBox = key.currentContext!.findRenderObject() as RenderBox?;
    final offset = renderBox!.localToGlobal(Offset.zero);
    return offset;
  }

  void sizeChanged(Size size) => sizeNotifier.value = size;

  void selectMaterialColor(MaterialColor color) =>
      selectedColorNotifier.value = selectedColor.copyWith(
        materialColor: color,
      );
  void selectShade(int shade) =>
      selectedColorNotifier.value = selectedColor.copyWith(
        shade: shade,
      );
}
