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
  final ChangeNotifierbuilder<T> builder;
  final Widget? child;
  static T of<T extends ChangeNotifier>(BuildContext context) {
    try {
      return context
          .dependOnInheritedWidgetOfExactType<_ChangeNotifierBuilder<T>>()!
          .notifier!;
    } catch (e) {
      LoggerService().error(e);
      throw FlutterError(
        'No ChangeNotifierBuilder of type $T found on the scope. '
        'Make sure you have ChangeNotifierBuilder'
        ' high up on the widget tree, if you do have it but still get this'
        ' try wrapping the current widget with Builder'
        ' and use the context from it or extract to a new Stateless '
        'or Stateful Widget.',
      );
    }
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
