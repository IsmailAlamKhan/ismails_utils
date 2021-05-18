import 'dart:io';

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
