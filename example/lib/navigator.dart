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

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Home1(),
              ),
            );
          },
          child: const Text('To Home 1'),
        ),
      ),
    );
  }
}

class Home1 extends StatefulWidget {
  const Home1({
    Key? key,
  }) : super(key: key);

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  // late final navController = IsmailNavigatorController();
  final _key = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    print('Home 1');
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: Navigator(
        key: _key,
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return MaterialPageRoute(
              settings: settings,
              builder: (ctx) => Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    },
                    child: const Text('To Home'),
                  ),
                  TextButton(
                    onPressed: () {
                      _key.currentState!.pushNamed('/hello');
                    },
                    child: const Text('To Hello'),
                  ),
                ],
              ),
            );
          } else {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => TextButton(
                onPressed: () {
                  _key.currentState!.pop();
                },
                child: const Text('Back'),
              ),
            );
          }
        },
      ),
    );
  }
}
