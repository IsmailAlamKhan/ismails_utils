import 'package:flutter/widgets.dart';

import '../src.dart';
import '../utils/typedef.dart';

/// {@template ismails_utils.widgets.ChangeNotifierBuilder}
/// A builder which updates when the provided change notifier calls
/// notifylistners
/// {@endtemplate}

class ChangeNotifierBuilder<T extends ChangeNotifier> extends StatelessWidget {
  /// {@macro ismails_utils.widgets.ChangeNotifierBuilder}
  const ChangeNotifierBuilder({
    Key? key,
    required this.notifier,
    required this.builder,
    this.child,
  }) : super(key: key);

  final T notifier;
  final ChangeNotifierbuilderTypeDef<T> builder;
  final Widget? child;
  static T of<T extends ChangeNotifier>(BuildContext context) {
    assert(inheritedWidgetNotFound<_ChangeNotifierBuilder<T>>(context));
    return context
        .dependOnInheritedWidgetOfExactType<_ChangeNotifierBuilder<T>>()!
        .notifier!;
  }

  @override
  Widget build(BuildContext context) {
    return _ChangeNotifierBuilder<T>(
      notifier: notifier,
      child: Builder(
        builder: (context) =>
            builder(context, ChangeNotifierBuilder.of<T>(context), child),
      ),
    );
  }
}

class _ChangeNotifierBuilder<T extends ChangeNotifier>
    extends InheritedNotifier<T> {
  const _ChangeNotifierBuilder({
    required Widget child,
    required T notifier,
  }) : super(child: child, notifier: notifier);
}
