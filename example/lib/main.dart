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

const list = [
  'https://images.pexels.com/photos/4240093/pexels-photo-4240093.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6832295/pexels-photo-6832295.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6751203/pexels-photo-6751203.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6751203/pexels-photo-6751203.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6751203/pexels-photo-6751203.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6751203/pexels-photo-6751203.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6751203/pexels-photo-6751203.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6751203/pexels-photo-6751203.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6751203/pexels-photo-6751203.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6751203/pexels-photo-6751203.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6751203/pexels-photo-6751203.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6751203/pexels-photo-6751203.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6751203/pexels-photo-6751203.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6751203/pexels-photo-6751203.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
];

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ease = 0.0.ease();
  @override
  Widget build(BuildContext context) {
    return Motion(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Motion(() => SlimySwitch(
                // size: ,
                currentIndex: ease(),
                items: const ['Hello', 'Bello'],
                onChanged: ease,
              )),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: ease().between(0.0, 0.5)
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: list.length,
                  itemBuilder: (_, index) => Card(
                    color: Colors.green,
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(list[index]),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
