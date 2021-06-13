import 'dart:async';

import 'package:flutter/material.dart';

import '../src.dart';

class ColorPickerControllerController {
  final AnimationController animationController;
  final ColorPickerModel? selectedColorFromParent;

  final Duration transitionDuration;
  final Curve transitionCurve;

  ColorPickerControllerController({
    required this.animationController,
    required this.selectedColorFromParent,
    required this.transitionDuration,
    required this.transitionCurve,
  }) {
    init();
  }

  final colors = ColorPickerModel.colorList;
  late final List<GlobalKey> keys;
  late final ValueNotifier<ColorPickerModel> selectedColorNotifier =
      ValueNotifier<ColorPickerModel>(
    selectedColorFromParent ??
        ColorPickerModel(materialColor: colors[0], shade: defaultColorShade),
  );

  ColorPickerModel get selectedColor => selectedColorNotifier.value;
  late final sizeNotifier = ValueNotifier<Size>(Size.zero);
  late final positionNotifier = ValueNotifier<double>(0);

  Timer? timer;
  Future<void> setPostion() async {
    final index = colors.indexOf(selectedColorNotifier.value.materialColor);
    final target = calculatePosition(index).dx;

    animationController.animateTo(
      target,
      duration: transitionDuration,
      curve: Curves.easeInOut,
    );
  }

  void init() {
    keys = List.generate(colors.length, (_) => GlobalKey());
    if (selectedColorFromParent != null) {
      selectedColorNotifier.value = selectedColorFromParent!;
    }
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setPostion();
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
    timer?.cancel();
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
