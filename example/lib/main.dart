import 'dart:io';

import 'package:flutter/material.dart';
import 'package:some_basic_utils/some_basic_utils.dart';

Future<void> main() async {
  LoggerService.init();
  await FileService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: ContextLessNavigation(MyHomePage(title: 'Flutter Demo Home Page')),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _dir = Directory('path');
  late List<FileSystemEntity> _list;
  @override
  void initState() {
    super.initState();
    _list = _dir.listSync(recursive: true, followLinks: true);
    final stream = _dir.watch(events: FileSystemEvent.all, recursive: true);
    stream.listen((event) {
      _list = _dir.listSync(recursive: true, followLinks: true);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_list[index].path),
        ),
      ),
    );
  }
}

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            ContextLessNavigation.navigateBack();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.ac_unit_outlined),
            onPressed: () {
              showDialog(
                  context: ContextLessNavigation.context,
                  builder: (context) => AlertDialog(),
                  barrierDismissible: true);
            },
          ),
        ],
      ),
    );
  }
}
