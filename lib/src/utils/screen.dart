import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../src.dart';

class ScreenUtil {
  final BuildContext context;
  ScreenUtil.of(this.context);
  double get dp => context.width;

  bool get smallPhone => dp.between(0, 359);
  bool get medPhone => dp.between(360, 399);
  bool get largePhone => dp.between(400, 479);
  bool get xlargePhone => dp.between(480, 599);

  bool get smallTab => dp.between(600, 719);
  bool get medTab => dp.between(720, 839);
  bool get largeTab => dp.between(840, 959);
  bool get xlargeTab => dp.between(960, 1053);

  bool get smallDesktop => dp.between(1024, 1279);
  bool get mediumDesktop => dp.between(1280, 1439);
  bool get largeDesktop => dp.between(1440, 1599);
  bool get xlargeDesktop => dp.between(1600, 1919);
  bool get xxlargeDesktop => dp >= 1922;

  bool get phone => smallPhone || medPhone || largePhone || xlargePhone;
  bool get tab => smallTab || medTab || largeTab || xlargeTab;
  bool get desktop =>
      smallDesktop ||
      mediumDesktop ||
      largeDesktop ||
      xlargeDesktop ||
      xxlargeDesktop;

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

  double get pixelRatio {
    if (dp.between(160, 240)) return 1.0;
    if (dp.between(240, 320)) return 1.5;
    if (dp.between(320, 480)) return 2.0;
    if (dp.between(480, 640)) return 3.0;
    return 4.0;
  }
}
