import 'package:flutter/material.dart';
import 'package:just_motion/just_motion.dart';

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
    const p1 = Offset(0, 0);
    const p2 = Offset(90, 0);
    final mover = p1.ease(minDistance: .01, ease: 1 / 10);
    final scale = .25.ease(minDistance: .01, ease: 1 / 20);
    mover.to(p2, delay: 0);
    scale.to(2, delay: 0);

    scale.addStatusListener(() {
      // print('Scale status ${scale}');
      if (scale.completed) {
        mover(mover() == p1 ? p2 : p1);
        scale(scale() < 1 ? 2 : .25);
      }
    });
    // TickerMan.instance.motions.forEach((mo) {
    //   print(mo);
    //   print(mo.hasListeners);
    // });
    // print(TickerMan.instance.motions);
    return Motion(
      () => Transform.translate(
        offset: mover(),
        child: Transform.scale(
          scale: scale(),
          child: Container(
            color: Colors.blue,
            width: 40,
            height: 40,
          ),
        ),
      ),
      key: ValueKey('scaler'),
    );
  }
}
