import 'package:flutter/material.dart';
import 'package:just_motion/just_motion.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: DemoMemory(),
    );
  }
}

class DemoMemory extends StatefulWidget {
  const DemoMemory({Key? key}) : super(key: key);

  @override
  _DemoMemoryState createState() => _DemoMemoryState();
}

class _DemoMemoryState extends State<DemoMemory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: MoveBox(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }
}

class MoveBox extends StatelessWidget {
  const MoveBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scale = .25.ease(minDistance: .01, ease: 1 / 20);
    scale.to(2, delay: 0);
    scale.addStatusListener(() {
      if (scale.completed) {
        scale(scale() < 1 ? 2 : .25);
      }
    });
    print(TickerMan.instance.motions);
    return Motion(
      () => Transform.scale(
        scale: scale(),
        child: Container(
          color: Colors.blue,
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
