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

CrossFadeState crossFadeState(bool cond) {
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

String notFoundOnScopeError(String type) {
  return 'No $type found on the scope. '
      'Make sure you have $type'
      ' high up on the widget tree, if you do have it but still get this'
      ' try wrapping the current widget with Builder'
      ' and use the context from it or extract to a new Stateless '
      'or Stateful Widget.';
}

const materialcolorShades = {50, 100, 200, 300, 400, 500, 600, 700, 800, 900};
const defaultColorShade = 400;

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
final _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ),
    );
