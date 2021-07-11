import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../src.dart';

const _themeFromStorageKey = 'thememode';

class ThemeChanger extends ChangeNotifier with IsmailLoggerMixin {
  final SharedPreferences _sharedPreferences;
  ThemeChanger(SharedPreferences sharedPreferences)
      : _sharedPreferences = sharedPreferences {
    _init();
  }

  @override
  String name = 'ThemeChanger';
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
    logInfo('Changing theme from $_themeMode to $themeMode');
    _themeMode = themeMode;
    _storeThemeToStorage();
    notifyListeners();
  }

  void _storeThemeToStorage() =>
      _sharedPreferences.setString(_themeFromStorageKey, _themeMode.toString());

  ThemeMode _getThemeFromStorage() {
    String? _themeFromStorage =
        _sharedPreferences.getString(_themeFromStorageKey);
    if (_themeFromStorage == null) {
      logInfo(
        'No theme found from storage using the default one',
      );
    } else {
      logInfo('$_themeFromStorage got from storage');
    }
    _themeFromStorage ??= themeMode.toString();

    return _themeFromStorage.toEnum<ThemeMode>(ThemeMode.values);
  }

  void _init() => changeTheme(_getThemeFromStorage());

  static ThemeChanger of(BuildContext context) {
    return ChangeNotifierBuilder.of<ThemeChanger>(context);
  }
}
