import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

CrossFadeState crossFadeState(bool cond) {
  if (cond) {
    return CrossFadeState.showFirst;
  } else {
    return CrossFadeState.showSecond;
  }
}

bool get isMaterial =>
    Platform.isAndroid ||
    Platform.isWindows ||
    Platform.isFuchsia ||
    Platform.isLinux;

bool get isDesktop =>
    Platform.isLinux || Platform.isWindows || Platform.isMacOS;

PlatformException throwPlatformException(String messege) =>
    PlatformException(code: 'un-supported', message: messege);
