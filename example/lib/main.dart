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
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final list = List.generate(10, (index) => 'ITEM ${index + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: ReorderAbleGridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: list.length,
        onReorder: (oldIndex, newIndex) {
          final oldData = list[oldIndex].toString();
          final newData = list[newIndex].toString();
          list[newIndex] = oldData;
          list[oldIndex] = newData;
        },
        itemBuilder: (_, index, isDragging) => Card(
          color: (isDragging) ? Colors.blue : Colors.red,
          child: Center(child: Text(list[index])),
        ),
      ),
    );
  }
}
