import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
      theme: ThemeData.dark(),
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

const _list = ['Hello!!', 'Bye!'];

class _HomeState extends State<Home> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: Column(
        children: [
          SlimySwitch(
            items: _list,
            currentIndex: index,
            size: const Size(180, 50),
            onChanged: (value) => setState(() => index = value),
            builder: (context, index, onChange) => InkWell(
              onTap: onChange,
              child: Center(child: Text(_list[index])),
            ),
          ),
          Center(child: Text(_list[index])),
        ],
      ),
    );
  }
}
