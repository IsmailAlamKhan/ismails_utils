import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LoggerService.init();
  FileService.init();
  if (isDesktop) doWhenWindowReady(() => appWindow.show());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),

      themeMode: ThemeMode.dark,
      // home: ContextLessNavigation(MyHomePage(title: 'Flutter Demo Home Page')),
      home: const ContextLessNavigation(MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Listener(
          onPointerDown: (event) {
            ContextLessNavigation.showErrorSnackbar(text: 'Hello');
          },
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.access_time),
          ),
        ),
      ),
    );
  }
}
