import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ismails_utils/ismails_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LoggerService.init();
  await FileService.init();
  doWhenWindowReady(() => appWindow.show());

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
      home: MyHomePage(),
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
            if (event.mouseButton.rightClick) {
              ContextMenu.of(context).iconMenu(event.localPosition);
            }
          },
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.access_time),
          ),
        ),
      ),
    );
  }
}
