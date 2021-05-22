import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:ismails_utils/ismails_utils.dart';

final logger = LoggerService();
final fileService = FileService.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeNotifier.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _themeNotifier = ThemeNotifier();
  @override
  void dispose() {
    _themeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _themeNotifier.builder(
      (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: ContextLessNavigation.key,
        themeMode: _themeNotifier.themeMode,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget with Logger, ThemeNotifierMixin {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PerformanceOverlay.allEnabled(),
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

class AppThemeData extends IsmailThemeData {
  final Color scaffoldColor;
  final Color iconColor;

  AppThemeData({
    required this.scaffoldColor,
    required this.iconColor,
  });
  AppThemeData.light()
      : scaffoldColor = Colors.green,
        iconColor = Colors.red;
  AppThemeData.dark()
      : scaffoldColor = Colors.blue,
        iconColor = Colors.green;
  static AppThemeData lerp(AppThemeData a, AppThemeData b, double t) {
    return AppThemeData(
      scaffoldColor: Color.lerp(a.scaffoldColor, b.scaffoldColor, t)!,
      iconColor: Color.lerp(a.iconColor, b.iconColor, t)!,
    );
  }

  AppThemeData copyWith({
    Color? scaffoldColor,
    Color? iconColor,
  }) {
    return AppThemeData(
      scaffoldColor: scaffoldColor ?? this.scaffoldColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }
}

class AppThemeDataTween extends IsmailThemeDataTween<AppThemeData> {
  AppThemeDataTween({AppThemeData? begin, AppThemeData? end})
      : super(begin: begin, end: end);

  @override
  AppThemeData lerp(double t) => AppThemeData.lerp(begin!, end!, t);
}
