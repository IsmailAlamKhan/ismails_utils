import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../src.dart';

const _themeFromStorageKey = 'thememode';
mixin ThemeNotifierMixin {
  ThemeNotifier get themeNotifier => ThemeNotifier();
}

class ThemeNotifier extends ChangeNotifier with Logger {
  late final _pref = StorageService().pref;
  @override
  String name = 'ThemeNotifier';
  factory ThemeNotifier() => _instance;
  ThemeNotifier._();
  static final _instance = ThemeNotifier._();
  var _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  bool get isDark => _themeMode == ThemeMode.dark;
  void toggleDarkMode() {
    ThemeMode theme;
    if (themeMode != ThemeMode.dark) {
      theme = ThemeMode.dark;
    } else {
      theme = ThemeMode.light;
    }
    changeTheme(theme);
  }

  void setDark() => changeTheme(ThemeMode.dark);
  void setLight() => changeTheme(ThemeMode.light);
  void setSystem() => changeTheme(ThemeMode.system);

  void changeTheme(ThemeMode themeMode) {
    if (themeMode == _themeMode) return;
    _instance.logger.info('Changing theme from $_themeMode to $themeMode');
    _themeMode = themeMode;
    _storeThemeToStorage();
    notifyListeners();
  }

  void _storeThemeToStorage() =>
      _pref.setString(_themeFromStorageKey, _themeMode.toString());

  ThemeMode _getThemeFromStorage() {
    String? _themeFromStorage = _pref.getString(_themeFromStorageKey);
    if (_themeFromStorage == null) {
      _instance.logger.info(
        'No theme found from storage using the default one',
      );
    } else {
      _instance.logger.info('$_themeFromStorage got from storage');
    }

    _themeFromStorage ??= themeMode.toString();

    return _themeFromStorage.toEnum<ThemeMode>(ThemeMode.values);
  }

  static Future<void> init() async {
    _instance.changeTheme(_instance._getThemeFromStorage());
  }
}
