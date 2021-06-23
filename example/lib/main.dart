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

const colors = [Colors.green, Colors.red];

class _HomeState extends AnimationControllerState<Home> {
  @override
  Widget build(BuildContext context) {
    return Motion(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: AnimatedBuilder(
            animation: animation,
            builder: (_, __) {
              final anim = animation.value;
              final color = Color.lerp(colors[0], colors[1], anim);
              return SlimySwitch(
                activeColor: color,
                currentIndex: anim,
                items: const ['Hello', 'Bello'],
                onChanged: (value) {
                  animation.animateTo(
                    value,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
