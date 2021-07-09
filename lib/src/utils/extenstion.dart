import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphx/graphx.dart';
import '../src.dart';
import 'utils.dart';

extension ExtendedString on String {
  int? toInt() {
    if (isEmpty) return null;
    return int.tryParse(this);
  }

  DateTime toDate() => DateTime.parse(this);
  bool get isAlphabetic => isAlpha(this);
  T toEnum<T>(List<T> list) {
    return list.firstWhere((d) => d.toString() == this);
  }

  TextPainter textPainter([TextStyle? style]) => TextPainter(
        text: TextSpan(text: this, style: style),
      )
        ..textDirection = TextDirection.ltr
        ..layout();
  double get width => textPainter().width;
  double get height => textPainter().height;
}

extension ExtendedNum on num {
  double get _double => toDouble();
  SizedBox get sizedHeight => SizedBox(
        height: _double,
      );
  SizedBox get sizedWidth => SizedBox(
        width: _double,
      );
  EdgeInsetsGeometry get padAll => EdgeInsets.all(_double);
  EdgeInsetsGeometry get padBottom => EdgeInsets.only(bottom: _double);
  EdgeInsetsGeometry get padTop => EdgeInsets.only(top: _double);
  EdgeInsetsGeometry get padRight => EdgeInsets.only(right: _double);
  EdgeInsetsGeometry get padLeft => EdgeInsets.only(left: _double);
  EdgeInsetsGeometry get padHort => EdgeInsets.symmetric(horizontal: _double);
  EdgeInsetsGeometry get padVert => EdgeInsets.symmetric(vertical: _double);
  bool between(num begin, num end) => this >= begin && this < end;
  double sp(BuildContext context) => context.screenUtil.sp(this);
}

extension ExtendedOrientation on Orientation {
  bool get isLandscape => this == Orientation.landscape;
  bool get isPortrait => this == Orientation.portrait;
}

extension ExtendedAnimationController on AnimationStatus {
  /// The animation is stopped at the end.
  bool get isCompleted => this == AnimationStatus.completed;

  /// The animation is running backwards, from end to beginning.
  bool get isDismissed => this == AnimationStatus.dismissed;

  /// The animation is running from beginning to end.
  bool get forwarding => this == AnimationStatus.forward;

  /// The animation is stopped at the beginning.
  bool get reversing => this == AnimationStatus.reverse;
}

extension ExtendedBuildContext on BuildContext {
  GRect? get getRenderObjectBounds => ContextUtils.getRenderObjectBounds(this);
  ContextMenu get contextMenu => ContextMenu.of(this);
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> ismailSnackbar({
    required String text,
    required Color color,
    Duration duration = const Duration(seconds: 3),
    Animation<double>? animation,
    SnackBarAction? action,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    double elevation = 6,
    EdgeInsetsGeometry? margin,
    VoidCallback? onVisible,
    EdgeInsetsGeometry? padding,
    ShapeBorder? shape,
    double? width,
  }) =>
      IsmailSnackbar(
        margin: margin,
        onVisible: onVisible,
        padding: padding,
        shape: shape,
        width: width,
        elevation: elevation,
        text: text,
        color: color,
        behavior: behavior,
        duration: duration,
        animation: animation,
        action: action,
      ).show(this);

  ScreenUtil get screenUtil => ScreenUtil.of(this);

  ScreenSize get screenSize => screenUtil.screenSize;
  bool get phone => screenUtil.phone;
  bool get tab => screenUtil.tab;
  bool get desktop => screenUtil.desktop;
  double sp(num i) => screenUtil.sp(i);
}

extension ExtendedScreenSize on ScreenSize {
  String get string => toString().split('.')[1];
}

extension ExtendedButtonType on ButtonStyle {
  ButtonStyle customCopyWith(ButtonStyle buttonStyle) {
    return ButtonStyle(
      textStyle: buttonStyle.textStyle ?? textStyle,
      backgroundColor: buttonStyle.backgroundColor ?? backgroundColor,
      foregroundColor: buttonStyle.foregroundColor ?? foregroundColor,
      overlayColor: buttonStyle.overlayColor ?? overlayColor,
      shadowColor: buttonStyle.shadowColor ?? shadowColor,
      elevation: buttonStyle.elevation ?? elevation,
      padding: buttonStyle.padding ?? padding,
      minimumSize: buttonStyle.minimumSize ?? minimumSize,
      side: buttonStyle.side ?? side,
      shape: buttonStyle.shape ?? shape,
      mouseCursor: buttonStyle.mouseCursor ?? mouseCursor,
      visualDensity: buttonStyle.visualDensity ?? visualDensity,
      tapTargetSize: buttonStyle.tapTargetSize ?? tapTargetSize,
      animationDuration: buttonStyle.animationDuration ?? animationDuration,
      enableFeedback: buttonStyle.enableFeedback ?? enableFeedback,
    );
  }
}

extension ExtendedType on Object {
  bool get isEnum => toString().contains('.');

  String get getString {
    if (isEnum) {
      return describeEnum(this);
    } else {
      return toString();
    }
  }
}

extension FileExtension on File {
  String get read => FileManager.instance.readFile(this);
  void write(String val, [FileMode mode = FileMode.append]) =>
      FileManager.instance.writeFile(
        val,
        this,
        mode,
      );
}

extension PointerDownEventExtended on PointerEvent {
  MouseClick get mouseButton {
    switch (buttons) {
      case 1:
        return MouseClick.leftButton;
      case 2:
        return MouseClick.rightButton;
      case 4:
        return MouseClick.middleButton;
      default:
        return MouseClick.unk;
    }
  }
}

extension ExtendedMouseButton on MouseClick {
  bool get rightClick => this == MouseClick.rightButton;
  bool get leftClick => this == MouseClick.leftButton;
  bool get middleClick => this == MouseClick.middleButton;
}

extension ExtendedControlAffinity on ControlAffinity {
  bool get trailing => this == ControlAffinity.trailing;
  bool get leading => this == ControlAffinity.leading;
}

extension ExtendedFormFieldValidators<T> on List<FormFieldValidator<T>> {
  /// {@macro IsmailFormValidators.compose}
  FormFieldValidator<T> ismailFormValidatorCompose() {
    return IsmailFormValidators.compose(this);
  }
}

extension ExtendedListMapString on List<Map<String, dynamic>> {
  /// Get List of [IsmailFormFieldOption] from a map
  List<IsmailFormFieldOption<T>> ismailFormFieldOption<T>() =>
      map((map) => IsmailFormFieldOption<T>.fromJson(map)).toList();
}

extension ExtendedChangeNotifer on ChangeNotifier {
  /// {@macro ismails_utils.widgets.ChangeNotifierBuilder}
  Widget builder<T extends ChangeNotifier>(
    ChangeNotifierbuilderTypeDef<T> builder, {
    Widget? child,
  }) {
    return ChangeNotifierBuilder<T>(
      notifier: this as T,
      builder: builder,
      child: child,
    );
  }
}

extension ExtendedWidget on Widget {
  /// {@macro ismails_utils.widgets.KeepAlivePage}
  Widget get keepAlive => KeepAlivePage(this);
}

extension ExtendedInt on int {
  int loop(int index) => index % this;
}

extension MyTextStyle on TextStyle {
  Map<String, dynamic> toMap() {
    return {
      'inherit': inherit,
      'color': color?.value,
      'backgroundColor': backgroundColor?.value,
      'fontFamily': fontFamily,
      'fontSize': fontSize,
      'fontWeight': fontWeight.toString(),
      'fontStyle': fontStyle?.index,
      'letterSpacing': letterSpacing,
      'wordSpacing': wordSpacing,
      'height': height,
      'decorationThickness': decorationThickness,
      'debugLabel': debugLabel,
    };
  }
}

extension ExtendedSliverOverlapInjector on SliverOverlapInjector {
  static SliverOverlapInjector of(BuildContext context) =>
      SliverOverlapInjector(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
          context,
        ),
      );
}

extension ExtendedSliverOverlapAbsorber on SliverOverlapAbsorber {
  static SliverOverlapAbsorber of(BuildContext context, {Widget? sliver}) =>
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
          context,
        ),
        sliver: sliver,
      );
}

extension NestedScrollViewExt on NestedScrollView {
  static NestedScrollViewState? of(BuildContext context) =>
      context.findAncestorStateOfType<NestedScrollViewState>();
}

extension CapExtension on String {
  String toUpperCaseFirst() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String toUpperCaseFirstForEachWord() => replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.toUpperCaseFirst())
      .join(" ");
}
