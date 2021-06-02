import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../src.dart';

/// The typedef that [ResponsiveBuilder] uses for the builder
typedef ResponsiveWidgetBuilder = Widget Function(
  BuildContext context,
  ScreenUtil screenUtil,
  Widget? child,
  BoxConstraints constraints,
);

/// The typedef that [IsmailSnackbar] uses for the animation
/// [IsmailSnackbar.animBuilder]
typedef SnackBarAnimBuilder = Widget Function(
  Animation<double> animation,
  Widget child,
);

/// The typedef that [AlphabetListView] uses to build item
typedef AlphabetListViewItemBuilder<T extends AlphabetListViewModel> = Widget
    Function(
  BuildContext context,
  List<T> list,
  T item,
  int index,
);

/// The typedef that [AlphabetListView] uses for the sidebar
typedef AlphabetListViewSideBarBuilder = Widget Function(
  BuildContext context,
  bool isActive,
  String alphabet,
);

/// The typedef that [AlphabetListView] uses for the headerBuilder
typedef AlphabetListViewHeaderBuilder = Widget Function(
  BuildContext context,
  double stuckAmount,
  String alphabet,
);

/// The typedef that [IsmailCarousel.builder] uses for the itemBuilder
typedef CarouselWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T item,
);

typedef IsmailFormKey = GlobalKey<IsmailFormState>;
typedef FormKey = GlobalKey<FormState>;
typedef NavigatorKey = GlobalKey<NavigatorState>;
typedef ScaffoldKey = GlobalKey<ScaffoldState>;

typedef Messenger = ScaffoldMessenger;
typedef SnackbarController
    = ScaffoldFeatureController<SnackBar, SnackBarClosedReason>;
typedef ValueTransformer<T> = dynamic Function(T value);

typedef ChangeNotifierbuilder<T> = Widget Function(
  BuildContext context,
  T notifier,
  Widget? child,
);
