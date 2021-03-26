import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../src.dart';

class ScreenUtil {
  final BuildContext context;

  ScreenUtil(this.context);
  static ScreenUtil get find => Get.find();
  double get dp => context.devicePixelRatio * 160;

  bool get smallPhone {
    const _firstBreak = 0;
    const _lastBreak = 359;
    return dp >= _firstBreak && dp < _lastBreak;
  }

  bool get medPhone {
    const _firstBreak = 360;
    const _lastBreak = 399;

    return dp >= _firstBreak && dp < _lastBreak;
  }

  bool get largePhone {
    const _firstBreak = 400;
    const _lastBreak = 479;

    return dp >= _firstBreak && dp < _lastBreak;
  }

  bool get xlargePhone {
    const _firstBreak = 480;
    const _lastBreak = 599;
    return dp >= _firstBreak && dp < _lastBreak;
  }

  bool get smallTab {
    const _firstBreak = 600;
    const _lastBreak = 719;
    return dp >= _firstBreak && dp <= _lastBreak;
  }

  bool get medTab {
    const _firstBreak = 420;
    const _lastBreak = 839;
    return dp >= _firstBreak && dp < _lastBreak;
  }

  bool get largeTab {
    const _firstBreak = 840;
    const _lastBreak = 959;
    return dp >= _firstBreak && dp < _lastBreak;
  }

  bool get xlargeTab {
    const _firstBreak = 960;
    const _lastBreak = 1053;
    return dp >= _firstBreak && dp <= _lastBreak;
  }

  bool get phone => smallPhone || medPhone || largePhone || xlargePhone;
  bool get tab => smallTab || medTab || largeTab || xlargeTab;

  ScreenSize get screenSize {
    if (smallPhone) {
      return ScreenSize.SmallPhone;
    } else if (medPhone) {
      return ScreenSize.MediumPhone;
    } else if (largePhone) {
      return ScreenSize.LargePhone;
    } else if (xlargePhone) {
      return ScreenSize.XLargePhone;
    } else if (smallTab) {
      return ScreenSize.SmallTab;
    } else if (medTab) {
      return ScreenSize.MediumTab;
    } else if (largeTab) {
      return ScreenSize.LargeTab;
    } else if (xlargeTab) {
      return ScreenSize.XLargeTab;
    } else {
      return ScreenSize.NONE;
    }
  }

  String get dpText {
    if (dp.between(160, 240)) return 'mdpi';
    if (dp.between(240, 320)) return 'hdpi';
    if (dp.between(320, 480)) return 'xhdpi';
    if (dp.between(480, 640)) return 'xxhdpi';
    return 'xxxhdpi';
  }

  double get pixelRation {
    if (dp.between(160, 240)) return 1.0;
    if (dp.between(240, 320)) return 1.5;
    if (dp.between(320, 480)) return 2.0;
    if (dp.between(480, 640)) return 3.0;
    return 4.0;
  }
}
