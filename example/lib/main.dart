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
      home: Scaffold(
        body: Center(
          child: IsmailCarousel<Color>.builder(
            list: Colors.primaries,
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
                    fontSize: controller.width(index, customizer) - 10,
                  ),
                ),
              ),
            ),
            // scrollDirection: Axis.vertical,
            builder: (context, color) => Container(color: color),
          ),
        ),
      ),
    );
  }
}
