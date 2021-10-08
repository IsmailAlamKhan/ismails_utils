import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

/// Gets weither the platform will use Material or not
bool get isMaterial =>
    Platform.isAndroid ||
    Platform.isWindows ||
    Platform.isFuchsia ||
    Platform.isLinux;

/// Gets if the platform is desktop or not
bool get isDesktop =>
    Platform.isLinux || Platform.isWindows || Platform.isMacOS;
void focusChange({
  required BuildContext context,
  required FocusNode focusNode,
}) {
  FocusScope.of(context).requestFocus(focusNode);
}

CrossFadeState crossFadeState({bool cond = true}) {
  if (cond) {
    return CrossFadeState.showFirst;
  } else {
    return CrossFadeState.showSecond;
  }
}

TextStyle textStyleFromMap(Map<String, dynamic> map) {
  return TextStyle(
    inherit: map['inherit'],
    color: Color(map['color']),
    backgroundColor:
        map['backgroundColor'] == null ? null : Color(map['backgroundColor']),
    fontFamily: map['fontFamily'],
    fontSize: map['fontSize'],
    // fontWeight: fontWeight.toString(),
    fontStyle:
        map['fontStyle'] == null ? null : FontStyle.values[map['fontStyle']],
    letterSpacing: map['letterSpacing'],
    wordSpacing: map['wordSpacing'],
    height: map['height'],
    decorationThickness: map['decorationThickness'],
    debugLabel: map['debugLabel'],
  );
}


bool inheritedWidgetNotFound<T extends InheritedWidget>(BuildContext context) {
  assert(() {
    if (context.widget is! T &&
        context.getElementForInheritedWidgetOfExactType<T>() == null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('No $T widget ancestor found.'),
        ErrorDescription(
            '${context.widget.runtimeType} widgets require a $T widget ancestor.'),
        context.describeWidget(
            'The specific widget that could not find a $T ancestor was'),
        context.describeOwnershipChain(
            'The ownership chain for the affected widget is'),
        ErrorHint(
          'No $T ancestor could be found starting from the context '
          'that was passed to $T.of(). This can happen because you '
          'have not added a DefaultSlimySwitchController',
        ),
      ]);
    }
    return true;
  }());
  return true;
}


const materialcolorShades = {50, 100, 200, 300, 400, 500, 600, 700, 800, 900};
const defaultColorShade = 400;

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
final _rnd = Random();
String _getRandomString(int length, Random random) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(random.nextInt(_chars.length)),
      ),
    );

String getRandomString(int length) => _getRandomString(length, _rnd);

final _rndSecure = Random.secure();
String getSecureRandomString(int length) =>
    _getRandomString(length, _rndSecure);
