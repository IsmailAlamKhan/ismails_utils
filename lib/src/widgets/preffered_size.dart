import 'package:flutter/material.dart';
import '../../src/src.dart';

class IsmailPreferredSize extends StatelessWidget
    implements PreferredSizeWidget {
  const IsmailPreferredSize({
    Key? key,
    required this.builder,
    required this.preferredSize,
  }) : super(key: key);

  final WidgetBuilder builder;

  @override
  final Size preferredSize;

  static Size of(BuildContext context) {
    try {
      return context
          .findAncestorWidgetOfExactType<PreferredSize>()!
          .preferredSize;
    } catch (e) {
      throw FlutterError(notFoundOnScopeError('IsmailPreferredSize'));
    }
  }

  @override
  Widget build(BuildContext context) => PreferredSize(
        preferredSize: preferredSize,
        child: Builder(builder: builder),
      );
}
