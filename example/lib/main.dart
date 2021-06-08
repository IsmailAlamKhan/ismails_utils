import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MaterialColor? color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final pickedColor = await showDialog<MaterialColor>(
              context: context,
              builder: (_) => MaterialColorPicker(selectedColor: color),
            );
            if (pickedColor != null) {
              setState(() => color = pickedColor);
            }
          },
          style: ElevatedButton.styleFrom(primary: color),
          child: const Text('Pick color'),
        ),
      ),
    );
  }
}
