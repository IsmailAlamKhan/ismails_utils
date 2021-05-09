import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../src.dart';

typedef StateMixinChild<T> = Widget Function(List<T> value);
typedef StateMixinErrorWidget = Widget Function(String value);
typedef ResponsiveWidget = Widget Function(
  BuildContext context,
  ScreenUtil screenUtil,
  Widget? child,
  BoxConstraints constraints,
);
typedef SnackBarAnimBuilder = Widget Function(
  Animation<double> animation,
  Widget child,
);

typedef AlphabetListViewItemBuilder<T extends AlphabetListViewModel> = Widget
    Function(
  BuildContext context,
  List<T> list,
  T item,
  int index,
);
