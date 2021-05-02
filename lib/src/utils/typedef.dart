import 'package:flutter/material.dart';
import 'utils.dart';

typedef StateMixinChild<T> = Widget Function(List<T> value);
typedef StateMixinErrorWidget = Widget Function(String value);
typedef ResponsiveWidget = Widget Function(
  BuildContext context,
  ScreenUtil screenUtil,
);
typedef SnackBarAnimBuilder = Widget Function(
  Animation<double> animation,
  Widget child,
);
