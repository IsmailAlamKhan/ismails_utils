import 'package:flutter/widgets.dart';

class ChangeNotifierBuilder<T extends ChangeNotifier> extends StatefulWidget {
  const ChangeNotifierBuilder({
    Key? key,
    required this.notifier,
    required this.builder,
  }) : super(key: key);
  final T notifier;
  final WidgetBuilder builder;
  @override
  _ChangeNotifierBuilderState<T> createState() =>
      _ChangeNotifierBuilderState<T>();
}

class _ChangeNotifierBuilderState<T extends ChangeNotifier>
    extends State<ChangeNotifierBuilder<T>> {
  T get notifier => widget.notifier;
  void _listner() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    notifier.addListener(_listner);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChangeNotifierBuilder<T> oldWidget) {
    notifier.removeListener(_listner);
    notifier.addListener(_listner);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    notifier.removeListener(_listner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
