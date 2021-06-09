import 'package:flutter/material.dart';

class WidgetSizeNotifier extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onChange;

  const WidgetSizeNotifier(
      {Key? key, required this.onChange, required this.child})
      : super(key: key);

  @override
  _WidgetSizeNotifierState createState() => _WidgetSizeNotifierState();
}

class _WidgetSizeNotifierState extends State<WidgetSizeNotifier> {
  Size _oldSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _notify(context));
    return widget.child;
  }

  void _notify(BuildContext context) {
    final size = context.size!;
    if (size != _oldSize) {
      _oldSize = size;
      widget.onChange(size);
    }
  }
}
