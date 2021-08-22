import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../src.dart';

const _themeFromStorageKey = 'thememode';

class _ThemeChangeNotifier extends ChangeNotifier {
  final logger = IsmailLogger('Theme changer');
  final SharedPreferences _sharedPreferences;
  _ThemeChangeNotifier(SharedPreferences sharedPreferences)
      : _sharedPreferences = sharedPreferences {
    _init();
  }

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
    logger.info('Changing theme from $_themeMode to $themeMode');
    _themeMode = themeMode;
    _storeThemeToStorage();
    notifyListeners();
  }

  void _storeThemeToStorage() =>
      _sharedPreferences.setString(_themeFromStorageKey, _themeMode.toString());

  ThemeMode _getThemeFromStorage() {
    var _themeFromStorage = _sharedPreferences.getString(_themeFromStorageKey);
    if (_themeFromStorage == null) {
      logger.info(
        'No theme found from storage using the default one',
      );
    } else {
      logger.info('$_themeFromStorage got from storage');
    }
    _themeFromStorage ??= themeMode.toString();

    return _themeFromStorage.toEnum<ThemeMode>(ThemeMode.values);
  }

  void _init() {
    logger.init();
    changeTheme(_getThemeFromStorage());
  }

  @override
  String toString() => 'ThemeChanger: CurrentThemeMode = $themeMode';
  @override
  void dispose() {
    logger.dispose();
    super.dispose();
  }
}

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({
    Key? key,
    required this.builder,
    required this.preferences,
  }) : super(key: key);
  final ChangeNotifierbuilderTypeDef<_ThemeChangeNotifier> builder;
  final SharedPreferences preferences;
  static _ThemeChangeNotifier of(BuildContext context) =>
      ChangeNotifierBuilder.of<_ThemeChangeNotifier>(context);
  @override
  _ThemeChangerState createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  late final _ThemeChangeNotifier themeChanger =
      _ThemeChangeNotifier(widget.preferences);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierBuilder<_ThemeChangeNotifier>(
      notifier: themeChanger,
      builder: widget.builder,
    );
  }
}
