import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils.dart';

class CustomPrint {
  List<Object?>? arg;
  PrintType printType;
  CustomPrint(this.arg, {this.printType = PrintType.Info}) {
    _customPrint();
  }

  String? get text => arg?.join(',').toString();

  void _customPrint() {
    String? leading;
    const error = '📕 \x1B[31m';
    const success = '📗 \x1B[32m';
    const info = '📘 \x1B[36m';
    switch (printType) {
      case PrintType.Error:
        leading = error;
        break;
      case PrintType.Success:
        leading = success;
        break;
      case PrintType.Info:
        leading = info;
        break;
      default:
    }
    log(
      '$leading$text\x1B[0m',
      name: 'UPP $this',
    );
  }
}

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

PlatformException throwPlatformException(String messege) =>
    PlatformException(code: 'un-supported', message: messege);
