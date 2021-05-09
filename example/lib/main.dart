import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ismails_utils/ismails_utils.dart';

import 'form.dart';

final logger = LoggerService();
final fileService = FileService.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(home: FormPage());
}
