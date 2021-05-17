import 'dart:async';

import 'package:flutter/material.dart';

import 'package:ismails_utils/ismails_utils.dart';

final logger = LoggerService();
final fileService = FileService.instance;
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final IsmaiLCarouselController controller;
  @override
  void initState() {
    super.initState();
    controller = IsmaiLCarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: ContextLessNavigation.key,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.sanitizer),
              onPressed: () {
                ContextLessNavigation.showSnackbar(
                  text: 'Welcome',
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.ac_unit),
              onPressed: () {
                ContextLessNavigation.navigateTo(
                  MaterialPageRoute(
                    builder: (context) => One(),
                  ),
                );
              },
            )
          ],
        ),
        body: Center(
          child: IsmailCarousel.builder(
            itemCount: Colors.primaries.length,
            controller: controller,
            indicatorCustomizer: IsmailCarouselIndicatorCustomizer(
              activeColor: context.theme.primaryColor,
              inActiveColor: context.theme.disabledColor,
              width: 15,
              height: 10,
              builder: (context, index, customizer, _) => GestureDetector(
                onTap: () => controller.scrollTo(index),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: controller.color(index, customizer),
                  ),
                ),
              ),
            ),
            // scrollDirection: Axis.vertical,
            builder: (context, color) =>
                Container(color: Colors.primaries[color]),
          ),
        ),
      ),
    );
  }
}

class One extends StatelessWidget {
  const One({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
