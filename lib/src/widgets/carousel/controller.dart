import 'package:flutter/material.dart';
import '../../src.dart';

class IsmaiLCarouselController extends ChangeNotifier {
  IsmaiLCarouselController() {
    onInit();
  }
  late final PageController pageController;

  int _activeIndex = 0;
  int get activeIndex => _activeIndex;
  bool active(int index) => activeIndex == index;
  Color color(
    int index,
    IsmailCarouselIndicatorCustomizer customizer,
  ) =>
      active(index) ? customizer.activeColor : customizer.inActiveColor;

  double width(
    int index,
    IsmailCarouselIndicatorCustomizer customizer,
  ) =>
      active(index) ? customizer.activeWidth : customizer.width;

  set activeIndex(int value) {
    if (value == _activeIndex) return;
    _activeIndex = value;
    notifyListeners();
  }

  void onInit() {
    pageController = PageController();
  }

  bool pageIsScrolling = false;

  void pageListner(int itemCount) {
    assert(
      pageController.hasClients,
      "Make sure you assigned the controller to a Carousel."
      " If you didn't use a custom controller then its a"
      " problem on the source code",
    );
    final _value = pageController.page?.round() ?? 0;
    if (_value != activeIndex) {
      activeIndex = _value % itemCount;
    }
  }

  Future<void> scroll(
    CarouselScrollDirection direction, {
    Duration? duration,
    Curve curves = Curves.easeInOut,
  }) async {
    assert(
      pageController.hasClients,
      "Make sure you assigned the controller to a Carousel."
      " If you didn't use a custom controller then its a"
      " problem on the source code",
    );
    duration ??= const Duration(milliseconds: 500);
    if (pageIsScrolling == false) {
      pageIsScrolling = true;
      switch (direction) {
        case CarouselScrollDirection.increase:
          await pageController.nextPage(
            duration: duration,
            curve: curves,
          );
          pageIsScrolling = false;
          break;
        default:
          await pageController.previousPage(
            duration: duration,
            curve: curves,
          );
      }

      pageIsScrolling = false;
    }
  }

  Future<void> scrollTo(
    int page, {
    Duration? duration,
    Curve curve = Curves.easeInOut,
  }) {
    assert(
      pageController.hasClients,
      "Make sure you assigned the controller to a Carousel."
      " If you didn't use a custom controller then its a"
      " problem on the source code",
    );
    duration ??= const Duration(milliseconds: 500);
    return pageController.animateToPage(page, duration: duration, curve: curve);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
