import 'package:flutter/widgets.dart';

/// A builder which updates when the provided change notifier calls
/// notifylistners

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
    /// listens to the change notifier and calls setState to update
    /// the widget
    notifier.addListener(_listner);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChangeNotifierBuilder<T> oldWidget) {
    if (oldWidget.notifier != widget.notifier) {
      notifier.removeListener(_listner);
      notifier.addListener(_listner);
    }
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
