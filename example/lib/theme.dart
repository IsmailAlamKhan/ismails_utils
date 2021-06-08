import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ismails_utils/ismails_utils.dart';

final logger = LoggerService();
final fileService = FileService.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  ThemeChangeNotifier.init();
  CustomThemeSwitcher.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _themeNotifier = ThemeChangeNotifier();
  final _customThemeSwitcher = CustomThemeSwitcher();
  @override
  void dispose() {
    _themeNotifier.dispose();
    _customThemeSwitcher.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _themeNotifier.builder<ThemeChangeNotifier>(
      (_, themeNotifier, __) =>
          _customThemeSwitcher.builder<CustomThemeSwitcher>(
        (_, customThemeSwitcher, __) => MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: ContextLessNavigation.key,
          themeMode: themeNotifier.themeMode,
          builder: (context, child) {
            final brightness = Theme.of(context).brightness;
            final _theme = brightness == Brightness.dark
                ? customThemeSwitcher.customDarkTheme ?? AppThemeData.dark()
                : customThemeSwitcher.customLightTheme ?? AppThemeData.light();
            final _matTheme = brightness == Brightness.dark
                ? ThemeData.dark()
                : ThemeData.light();
            final materialTheme = _matTheme.copyWith(
              scaffoldBackgroundColor: _theme.scaffoldColor,
              textTheme: _matTheme.textTheme.copyWith(
                headline6: _theme.textStyle,
              ),
            );
            return AnimatedIsmailTheme(
              duration: const Duration(milliseconds: 100),
              data: _theme,
              tweenConstructor: (begin) => AppThemeDataTween(begin: begin),
              child: AnimatedTheme(
                duration: const Duration(milliseconds: 100),
                data: materialTheme,
                child: child!,
              ),
            );
          },
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const Home(),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget with Logger {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ThemeChangeNotifier.of(context);
    return Scaffold(
      bottomNavigationBar: const ThemeSettings(),
      body: Container(
        padding:
            EdgeInsets.only(top: IsmailTheme.of<AppThemeData>(context).padding),
        child: Center(
          child: Text(
            'TEXT',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.ac_unit),
            onPressed: () {
              themeNotifier.toggleDarkMode();
            },
          ),
          PopupMenuButton(
            onSelected: themeNotifier.changeTheme,
            itemBuilder: (context) => ThemeMode.values
                .map(
                  (e) => PopupMenuItem(
                    value: e,
                    enabled: themeNotifier.themeMode != e,
                    child: Text(e.getString),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = IsmailTheme.of<AppThemeData>(context);
    return SizedBox(
      height: 210,
      child: BottomAppBar(
        child: Column(
          children: [
            Slider(
              value: _theme.textStyle.fontSize ?? 0.0,
              max: 200,
              onChanged: (value) {
                CustomThemeSwitcher().changeCustomTheme(
                  context,
                  true,
                  _theme.copyWith(
                      textStyle: _theme.textStyle.copyWith(fontSize: value)),
                );
              },
            ),
            Slider(
              value: _theme.padding,
              max: 200,
              onChanged: (value) {
                CustomThemeSwitcher().changeCustomTheme(
                  context,
                  true,
                  _theme.copyWith(padding: value),
                );
              },
            ),
            _ColorPicker(
              title: 'Scaffold',
              activeColor: _theme.scaffoldColor,
              onChanged: (color) {
                CustomThemeSwitcher().changeCustomTheme(
                  context,
                  true,
                  _theme.copyWith(scaffoldColor: color),
                );
              },
            ),
            _ColorPicker(
              title: 'TextColor',
              activeColor: _theme.textStyle.color ?? Colors.white,
              onChanged: (color) {
                CustomThemeSwitcher().changeCustomTheme(
                  context,
                  true,
                  _theme.copyWith(
                    textStyle: _theme.textStyle.copyWith(color: color),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({
    Key? key,
    required this.onChanged,
    required this.activeColor,
    required this.title,
  }) : super(key: key);

  final Function(Color color) onChanged;
  final Color activeColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Colors.primaries.length,
                itemBuilder: (context, index) {
                  final color = Colors.primaries[index];
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: Material(
                          color: color,
                          // type: MaterialType.circle,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: activeColor.value == color.value
                                ? BorderSide(
                                    color:
                                        darkMode ? Colors.white : Colors.black,
                                    width: 3,
                                  )
                                : BorderSide.none,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () => onChanged(color),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppThemeData extends IsmailThemeData {
  final Color scaffoldColor;
  final Color iconColor;
  final TextStyle textStyle;
  final double padding;

  AppThemeData({
    required this.scaffoldColor,
    required this.iconColor,
    required this.textStyle,
    required this.padding,
  });
  AppThemeData.light()
      : scaffoldColor = Colors.green,
        iconColor = Colors.red,
        textStyle = const TextStyle(fontSize: 20, color: Colors.black),
        padding = 8;
  AppThemeData.dark()
      : scaffoldColor = Colors.blue,
        iconColor = Colors.green,
        textStyle = const TextStyle(fontSize: 20, color: Colors.white),
        padding = 8;

  static AppThemeData lerp(AppThemeData a, AppThemeData b, double t) {
    return AppThemeData(
      scaffoldColor: Color.lerp(a.scaffoldColor, b.scaffoldColor, t)!,
      iconColor: Color.lerp(a.iconColor, b.iconColor, t)!,
      textStyle: t < .5 ? a.textStyle : b.textStyle,
      padding: lerpDouble(a.padding, b.padding, t)!,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'scaffoldColor': scaffoldColor.value,
      'iconColor': iconColor.value,
      'textStyle': textStyle.toMap(),
      'padding': padding,
    };
  }

  factory AppThemeData.fromMap(Map<String, dynamic> map) {
    return AppThemeData(
      scaffoldColor: Color(map['scaffoldColor']),
      iconColor: Color(map['iconColor']),
      textStyle: textStyleFromMap(map['textStyle']),
      padding: map['padding'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppThemeData.fromJson(String source) =>
      AppThemeData.fromMap(json.decode(source));

  AppThemeData copyWith({
    Color? scaffoldColor,
    Color? iconColor,
    TextStyle? textStyle,
    double? padding,
  }) {
    return AppThemeData(
      scaffoldColor: scaffoldColor ?? this.scaffoldColor,
      iconColor: iconColor ?? this.iconColor,
      textStyle: textStyle ?? this.textStyle,
      padding: padding ?? this.padding,
    );
  }
}

class AppThemeDataTween extends IsmailThemeDataTween<AppThemeData> {
  AppThemeDataTween({AppThemeData? begin, AppThemeData? end})
      : super(begin: begin, end: end);

  @override
  AppThemeData lerp(double t) => AppThemeData.lerp(begin!, end!, t);
}

const _customLightThemeKey = 'custom_light_theme';
const _customDarkThemeKey = 'custom_dark_theme';
const _isCustomThemeKey = 'is_custom';

class CustomThemeSwitcher extends ChangeNotifier {
  factory CustomThemeSwitcher() => _instance;
  CustomThemeSwitcher._();
  static final _instance = CustomThemeSwitcher._();
  final _pref = StorageService().pref;
  bool _isCustom = false;
  bool get isCustom => _isCustom;

  AppThemeData? _customDarkTheme;
  AppThemeData? get customDarkTheme => _customDarkTheme;

  AppThemeData? _customLightTheme;
  AppThemeData? get customLightTheme => _customLightTheme;

  void changeCustomTheme(
    BuildContext context,
    bool val, [
    final AppThemeData? newTheme,
  ]) {
    _isCustom = val;
    if (Theme.of(context).brightness == Brightness.dark) {
      _customDarkTheme = newTheme;
    } else {
      _customLightTheme = newTheme;
    }

    logger.info(
      val ? 'Changing to custom theme' : 'Changing back to default theme',
    );
    notifyListeners();
    storeTheme();
  }

  void storeTheme() {
    if (_isCustom) {
      if (customLightTheme != null) {
        _pref.setString(_customLightThemeKey, customLightTheme!.toJson());
      }
      if (customDarkTheme != null) {
        _pref.setString(_customDarkThemeKey, customDarkTheme!.toJson());
      }
      _pref.setBool(_isCustomThemeKey, _isCustom);
    }
  }

  static void init() {
    final _isCustomTheme = _instance._pref.getBool(_isCustomThemeKey) ?? false;

    _instance._isCustom = _isCustomTheme;
    if (_instance._isCustom) {
      logger.info('Theme is custom');
      final _darkTheme = _instance._pref.getString(_customDarkThemeKey);
      final _lightTheme = _instance._pref.getString(_customLightThemeKey);
      if (_darkTheme != null) {
        _instance._customDarkTheme = AppThemeData.fromJson(_darkTheme);
      }
      if (_lightTheme != null) {
        _instance._customLightTheme = AppThemeData.fromJson(_lightTheme);
      }
    }
  }
}
