import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _notifier = SomeFutureResponseController()..init();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: Center(
        child: ValueListenableBuilder<FutureResponse<String>>(
          valueListenable: _notifier,
          builder: (context, value, child) {
            debugPrint('value: $value');
            return value.when(
              idle: () => const Text('Idle'),
              success: (value) => TextButton(onPressed: _notifier.reFetch, child: Text(value)),
              loading: () => const CircularProgressIndicator(),
              empty: () => const Text('Empty'),
              error: (e, s) {
                var text = '';
                if (e is MyException) {
                  text = e.message;
                }
                return TextButton(onPressed: _notifier.reFetch, child: Text(text));
              },
              loadingMore: (value) => Column(
                children: [
                  Text(value),
                  const CircularProgressIndicator(),
                ],
              ),
              loadingMoreError: (value, error, stactrace) => Column(
                children: [
                  Text(value.toString()),
                  Text(error.toString()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class SomeFutureResponseController extends ValueNotifier<FutureResponse<String>>
    with FutureResponseMixin<String> {
  SomeFutureResponseController() : super(const IdleFutureResponse());
  @override
  bool get autoFetch => true;

  @override
  void setState(FutureResponse<String> state) => value = state;

  @override
  Future<String>? future() => Future.delayed(const Duration(seconds: 5), () {
        if (Random().nextBool()) {
          throw const MyException('Error');
        }
        return 'I am done';
      });
}

class MyException implements Exception {
  const MyException(this.message);
  final String message;
}
