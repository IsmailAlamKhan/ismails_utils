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
  final AnimationController animationController;
  final ColorPickerModel? selectedColorFromParent;
  ColorPickerControllerController(
    this.selectedColorFromParent,
    this.animationController,
  ) {
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
  late final positionNotifier = ValueNotifier<double>(0);
  Future<void> setPostion([bool init = false]) async {
    final index = colors.indexOf(selectedColorNotifier.value.materialColor);
    final position = calculatePosition(index).dx;
    if (init) {
      positionNotifier.value = position;
    } else {
      animationController.animateTo(
        position,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  void init() {
    keys = List.generate(colors.length, (_) => GlobalKey());
    if (selectedColorFromParent != null) {
      selectedColorNotifier.value = selectedColorFromParent!;
    }
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setPostion(true);
    });
    animationController.addListener(() {
      positionNotifier.value = animationController.value;
    });
    selectedColorNotifier.addListener(setPostion);
    sizeNotifier.addListener(setPostion);
  }

  void onDragEnd(DragEndDetails details) {
    try {
      final currentPostion = positionNotifier.value;
      final tileSize = sizeNotifier.value.width;
      final _index = currentPostion ~/ tileSize;
      final index = _index.round();
      selectedColorNotifier.value = selectedColorNotifier.value.copyWith(
        materialColor: colors.elementAt(index),
      );
      setPostion();
    } catch (e, s) {
      LoggerService().error('S', e, s);
    }
  }

  double globalX = 0, oldGlobalX = 0;
  double minX = 5, maxX = 400;
  double tileW = 50;
  void onDragUpdate(DragUpdateDetails details) {
    globalX = details.globalPosition.dx;
    positionNotifier.value += globalX - oldGlobalX;
    animationController.value = positionNotifier.value;
    oldGlobalX = globalX;
  }

  void onDragStart(DragStartDetails details) {
    globalX = oldGlobalX = details.globalPosition.dx;
  }

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
