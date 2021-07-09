import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

enum ImageType { file, byte }

class _HomeState extends State<Home> {
  late final screenShotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
        actions: [
          PopupMenuButton<ImageType>(
            onSelected: (value) async {
              if (value == ImageType.file) {
                try {
                  final image = await screenShotController.capture<File>();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      scrollable: true,
                      content: Image.file(image),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$e')),
                  );
                  rethrow;
                }
              } else {
                try {
                  final image = await screenShotController.capture<Uint8List>();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      scrollable: true,
                      content: Image.memory(image),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$e')),
                  );
                  rethrow;
                }
              }
            },
            itemBuilder: (context) => ImageType.values
                .map<PopupMenuEntry<ImageType>>(
                  (e) => PopupMenuItem(
                    value: e,
                    child: Text(e.getString.toUpperCaseFirst()),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      body: ScreenshotWidget(
        screenshotController: screenShotController,
        child: const Center(child: Text('Hello World')),
      ),
    );
  }
}
