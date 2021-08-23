import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final list = List.generate(10, (index) => 'ITEM ${index + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: IsmailDateTimePickerFormField(
        name: 'Hello',
        lastDate: DateTime(2009),
        initialDate: DateTime(2009),
      ),
    );
  }
}
