import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: SlimyIndicatorPage(),
    );
  }
}

class SlimyIndicatorPage extends StatefulWidget {
  const SlimyIndicatorPage({Key? key}) : super(key: key);

  @override
  _SlimyIndicatorPageState createState() => _SlimyIndicatorPageState();
}

class _SlimyIndicatorPageState extends State<SlimyIndicatorPage> {
  int currentIndex = 0;
  final int itemCount = 2;
  late final list = List.generate(itemCount, (index) => 'Item ${index + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IsmailPreferredSize(
        preferredSize: const Size(180, 30),
        builder: (context) => SlimySwitch(
          items: list,
          size: IsmailPreferredSize.of(context),
          currentIndex: currentIndex,
          onChanged: (value) => setState(() => currentIndex = value),
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: list
            .map(
              (e) => Center(
                child: Text(e, style: Theme.of(context).textTheme.headline6),
              ),
            )
            .toList(),
      ),
    );
  }
}
