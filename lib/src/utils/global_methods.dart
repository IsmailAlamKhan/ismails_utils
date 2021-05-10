import 'dart:io';

/// Gets weither the platform will use Material or not
bool get isMaterial =>
    Platform.isAndroid ||
    Platform.isWindows ||
    Platform.isFuchsia ||
    Platform.isLinux;

/// Gets if the platform is desktop or not
bool get isDesktop =>
    Platform.isLinux || Platform.isWindows || Platform.isMacOS;
