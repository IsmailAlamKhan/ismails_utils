import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphx/graphx.dart';
import '../src.dart';
import 'utils.dart';

extension ExtendedString on String {
  int toInt() => int.parse(this);
  DateTime toDate() => DateTime.parse(this);
  bool get isAlphabetic => isAlpha(this);
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
}

extension ExtendedBuildContext on BuildContext {
  GRect? get getRenderObjectBounds => ContextUtils.getRenderObjectBounds(this);
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get accentColor => Theme.of(this).accentColor;
  ContextMenu get contextMenu => ContextMenu.of(this);
  void customSnackbar({
    required String text,
    required Color color,
    Duration duration = const Duration(seconds: 3),
    Duration animDuration = const Duration(milliseconds: 500),
  }) =>
      CustomSnackbar(
        text: text,
        color: color,
        animDuration: animDuration,
        duration: duration,
      ).show(this);

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
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
      return toString().substring(toString().indexOf('.') + 1);
    } else {
      return toString();
    }
  }
}

extension FileExtension on File {
  String get read => FileService.instance.readFile(this);
  void write(String val, [FileMode mode = FileMode.append]) =>
      FileService.instance.writeFile(
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

extension ExtendedCustomSnackbar on CustomSnackbar {
  CustomSnackbar copyWith({
    Duration? duration,
    Duration? animDuration,
    String? text,
    Color? color,
    SnackBarAnimBuilder? animBuilder,
  }) {
    return CustomSnackbar(
      animDuration: animDuration ?? this.animDuration,
      text: text ?? this.text,
      color: color ?? this.color,
      duration: duration ?? this.duration,
      animBuilder: animBuilder ?? this.animBuilder,
    );
  }
}

extension ExtendedControlAffinity on ControlAffinity {
  bool get trailing => this == ControlAffinity.trailing;
  bool get leading => this == ControlAffinity.leading;
}

extension ExtendedFormFieldValidators<T> on List<FormFieldValidator<T>> {
  FormFieldValidator<T> ismailFormValidatorCompose() {
    return IsmailFormValidators.compose(this);
  }
}

extension ExtendedListMapString on List<Map<String, dynamic>> {
  List<IsmailFormFieldOption<T>> ismailFormFieldOption<T>() =>
      map((map) => IsmailFormFieldOption<T>.fromJson(map)).toList();
}
