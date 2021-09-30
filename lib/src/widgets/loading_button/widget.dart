import 'package:flutter/material.dart';

import 'controller.dart';

class DefaultRoundedLoadingButtonController
    extends InheritedNotifier<RoundedLoadingButtonController> {
  DefaultRoundedLoadingButtonController({Key? key, required Widget child})
      : super(
          key: key,
          child: child,
          notifier: RoundedLoadingButtonController(),
        );

  static RoundedLoadingButtonController? of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<
          DefaultRoundedLoadingButtonController>()!
      .notifier;
}

class RoundedLoadingButton extends StatelessWidget {
  static get _defaultErrorBuilder => (context) => const Icon(Icons.error);
  static get _defaultLoadingBuilder => (context) => const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      );
  static get _defaultSuccessBuilder => (context) => const Icon(Icons.check);
  RoundedLoadingButton({
    Key? key,
    this.controller,
    required this.builder,
    this.onPressed,
    WidgetBuilder? errorBuilder,
    WidgetBuilder? successBuilder,
    WidgetBuilder? loadingBuilder,
    Duration? duration,
  })  : errorBuilder = errorBuilder ?? _defaultErrorBuilder,
        successBuilder = successBuilder ?? _defaultSuccessBuilder,
        loadingBuilder = loadingBuilder ?? _defaultLoadingBuilder,
        duration = duration ?? const Duration(milliseconds: 500),
        super(key: key);

  /// The [RoundedLoadingButtonController] that this button will use to
  /// communicate loading state changes.
  /// If no controller is supplied, you must have a [DefaultRoundedLoadingButtonController]
  /// somewhere in the widget tree above this button.
  final RoundedLoadingButtonController? controller;

  /// It will be shown when [RoundedLoadingButtonController.state] is [RoundedLoadingButtonController.idle].
  final WidgetBuilder builder;

  /// It will be shown when [RoundedLoadingButtonController.state] is [RoundedLoadingButtonController.error].
  /// If not supplied, the [RoundedLoadingButton] will show [_defaultErrorBuilder]
  final WidgetBuilder errorBuilder;

  /// It will be shown when [RoundedLoadingButtonController.state] is [RoundedLoadingButtonController.success].
  /// If not supplied, the [RoundedLoadingButton] will show [_defaultLoadingBuilder]
  final WidgetBuilder successBuilder;

  /// It will be shown when [RoundedLoadingButtonController.state] is [RoundedLoadingButtonController.loading].
  /// If not supplied, the [RoundedLoadingButton] will show [_defaultSuccessBuilder]
  final WidgetBuilder loadingBuilder;

  /// If this is null, the button will be disabled. this will be passed to the attached controller
  /// and automatically change states depending on what the method returns here is an example of this should look like
  /// ```dart
  /// RoundedLoadingButton(
  ///    builder: (context) => const Text('Hello'),
  ///    onPressed: () async {
  ///      await Future.delayed(const Duration(seconds: 1));
  ///      if (Random().nextBool()) {
  ///        throw Exception('Error');
  ///      }
  ///    },
  ///  )
  final Future<void> Function()? onPressed;

  /// This will be used for the animations like for the button change animation, widget changing animation
  /// with [AnimatedSwitcher], etc.
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final _controller =
        controller ?? DefaultRoundedLoadingButtonController.of(context);
    assert(
      _controller != null,
      'either pass a controller explicitly or wrap this widget with [DefaultRoundedLoadingButtonController]',
    );
    Widget _child;
    Color? _color;
    OutlinedBorder? _shape;

    switch (_controller!.state) {
      case RoundedLoadingButtonState.idle:
        _child = builder(context);
        break;
      case RoundedLoadingButtonState.loading:
        _child = loadingBuilder(context);
        _shape = const CircleBorder();
        break;
      case RoundedLoadingButtonState.success:
        _child = successBuilder(context);
        _color = Colors.green;
        break;
      case RoundedLoadingButtonState.error:
        _child = errorBuilder(context);
        _color = Colors.red;
        break;
    }
    return ElevatedButton(
      onPressed: _controller.onPressed(onPressed, duration),
      child: AnimatedSize(
        duration: duration,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedSwitcher(
            duration: duration,
            child: _child,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        animationDuration: duration,
        elevation: !_controller.canInteract ? 0 : null,
        enabledMouseCursor:
            _controller.canInteract ? SystemMouseCursors.click : null,
        primary: _color,
        shape: _shape,
      ),
    );
  }
}
