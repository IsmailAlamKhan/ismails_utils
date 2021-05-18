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
  double get width => mediaQueryData.size.width;
  double get height => mediaQueryData.size.width;

  bool get smallPhone => width.between(0, 359);
  bool get medPhone => width.between(360, 399);
  bool get largePhone => width.between(400, 479);
  bool get xlargePhone => width.between(480, 599);

  bool get smallTab => width.between(600, 719);
  bool get medTab => width.between(720, 839);
  bool get largeTab => width.between(840, 959);
  bool get xlargeTab => width.between(960, 1053);

  bool get smallDesktop => width.between(1024, 1279);
  bool get mediumDesktop => width.between(1280, 1439);
  bool get largeDesktop => width.between(1440, 1599);
  bool get xlargeDesktop => width.between(1600, 1919);
  bool get xxlargeDesktop => width >= 1922;

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
    if (width.between(160, 240)) return 1.0;
    if (width.between(240, 320)) return 1.5;
    if (width.between(320, 480)) return 2.0;
    if (width.between(480, 640)) return 3.0;
    return 4.0;
  }

  double sp(num i) => width / 100 * (i / 3);

  /// Get the keyboard height
  double get keyBoardHeight => MediaQuery.of(context).viewInsets.bottom;

  /// Private var to know if keyboard is visible
  bool _isKeyboardVisible = false;

  /// Keyboard is visible or not
  bool get isKeyboardVisible {
    final newValue = keyBoardHeight > 0.0;
    return _isKeyboardVisible = newValue != _isKeyboardVisible;
  }
}
