import 'package:flutter/material.dart';
import '../src.dart';

/// ScreenUtil class which is used the [ResponsiveBuilder] access this by
/// using the [ScreenUtil.of] constructor
class ScreenUtil {
  /// the main field of this class.
  final BuildContext context;

  /// ScreenUtil class which is used the [ResponsiveBuilder] access this by
  /// using the [ScreenUtil.of] constructor
  ScreenUtil.of(this.context);
  MediaQueryData get mediaQueryData => MediaQuery.of(context);
  double get deviceWidth => mediaQueryData.size.width;
  double get deviceheight => mediaQueryData.size.width;

  bool get smallPhone => deviceWidth.between(0, 359);
  bool get medPhone => deviceWidth.between(360, 399);
  bool get largePhone => deviceWidth.between(400, 479);
  bool get xlargePhone => deviceWidth.between(480, 599);

  bool get smallTab => deviceWidth.between(600, 719);
  bool get medTab => deviceWidth.between(720, 839);
  bool get largeTab => deviceWidth.between(840, 959);
  bool get xlargeTab => deviceWidth.between(960, 1053);

  bool get smallDesktop => deviceWidth.between(1024, 1279);
  bool get mediumDesktop => deviceWidth.between(1280, 1439);
  bool get largeDesktop => deviceWidth.between(1440, 1599);
  bool get xlargeDesktop => deviceWidth.between(1600, 1919);
  bool get xxlargeDesktop => deviceWidth >= 1922;

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

  /// Get the pixel ratio of the device
  double get pixelRatio {
    if (deviceWidth.between(160, 240)) return 1.0;
    if (deviceWidth.between(240, 320)) return 1.5;
    if (deviceWidth.between(320, 480)) return 2.0;
    if (deviceWidth.between(480, 640)) return 3.0;
    return 4.0;
  }
}
