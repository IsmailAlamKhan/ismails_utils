import 'package:flutter/material.dart';
import '../src.dart';

typedef StateMixinChild<T> = Widget Function(List<T> value);
typedef StateMixinErrorWidget = Widget Function(String value);
typedef ResponsiveWidget = Widget Function(
  BuildContext context,
  ScreenUtil screenUtil,
  Widget? child,
);
typedef SnackBarAnimBuilder = Widget Function(
  Animation<double> animation,
  Widget child,
);

typedef ListOfIsmailFormFieldOption<T> = List<IsmailFormFieldOption<T>>;
typedef ListOfBool = List<bool>;
