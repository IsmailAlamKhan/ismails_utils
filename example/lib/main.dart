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

const _list = ['Hello!!', 'Bye!', 'GOOD BYE!'];

class _HomeState extends State<Home> {
  double index = 0;
  late final PageController pageController;
  @override
  void initState() {
    pageController = PageController()
      ..addListener(() {
        setState(() {
          index = pageController.page ?? 0;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: Column(
        children: [
          SlimySwitch(
            items: _list,
            currentIndex: index,
            onChanged: (value) {
              print(value);
              pageController.animateTo(
                value,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
            builder: (context, index, onChange) => InkWell(
              onTap: onChange,
              child: Center(child: Text(_list[index])),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              // itemCount: _list.length,
              itemBuilder: (context, index) => Center(
                child: Text(_list[index]),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              pageController.nextPage(
                // 2.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
            child: Text('hello'),
          ),
        ],
      ),
    );
  }
}
