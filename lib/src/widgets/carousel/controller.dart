import 'package:flutter/material.dart';

class IsmaiLCarouselController extends ChangeNotifier {
  final int itemCount;
  IsmaiLCarouselController(this.itemCount) {
    onInit();
  }
  late final PageController pageController;

  int _activeIndex = 0;
  int get activeIndex => _activeIndex;
  set activeIndex(int value) {
    if (value == _activeIndex) return;
    _activeIndex = value;
    notifyListeners();
  }

  void onInit() {
    pageController = PageController()
      ..addListener(() {
        if (pageController.hasClients) {
          final _value = pageController.page?.round() ?? 0;
          if (_value != activeIndex) {
            activeIndex = _value % (itemCount - 1);
          }
        }
      });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
