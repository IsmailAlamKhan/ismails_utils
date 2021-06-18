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
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: Column(
        children: [
          Hello(),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                setState(() {});
              },
              child: const Text('Pick color'),
            ),
          ),
        ],
      ),
    );
  }
}

class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('HELLo');
    final color = 5.ease();
    return Container(
      height: 400,
      width: 400,
    );
  }
}
