import 'package:flutter/material.dart';

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

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Select Data',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text('Primary Button')),
          ],
        ),
      ),
    );
  }
}
