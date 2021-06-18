import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';
import 'package:just_motion/just_motion.dart';

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
  @override
  Widget build(BuildContext context) {
    final pickedColor = Colors.green.ease();
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: pickedColor.builder<EaseColor>(
        (_, pickedColor, ___) => Column(
          children: [
            const Hello(),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final _pickedColor = await const ColorPicker().show(context);

                  if (_pickedColor != null) {
                    pickedColor(_pickedColor.color);
                  }
                },
                child: const Text('Pick color'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Hello extends StatefulWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      color: ChangeNotifierBuilder.of<EaseColor>(context)(),
    );
  }
}
