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
    try {
      return context
          .dependOnInheritedWidgetOfExactType<_ChangeNotifierBuilder<T>>()!
          .notifier!;
    } catch (e, s) {
      final logger = IsmailLogger('ChangeNotifierBuilder');
      logger.error(
        'ChangeNotifierBuilder of type $T not found',
        error: e,
        stackTrace: s,
      );
      throw notFoundOnScopeError('ChangeNotifierBuilder of type $T');
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
