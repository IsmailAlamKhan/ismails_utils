import 'dart:async';
import 'package:flutter/material.dart';

import '../../ismails_utils.dart';

class IsmailSnackbar extends StatefulWidget {
  const IsmailSnackbar({
    Key? key,
    this.text,
    this.child,
    this.color,
    this.animBuilder,
    this.duration = const Duration(seconds: 3),
    this.animDuration = const Duration(milliseconds: 500),
  })  : assert(
          text != null || child != null,
          'IsmailSnackbar- Either pass a child or a text',
        ),
        super(key: key);
  final Duration duration, animDuration;
  final String? text;
  final Color? color;
  final Widget? child;
  final SnackBarAnimBuilder? animBuilder;
  @override
  IsmailSnackbarState createState() => IsmailSnackbarState();

  void show(BuildContext context, [Widget? child]) {
    final entry = OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.bottomLeft,
        child: child ?? this,
      ),
    );
    SnackbarManager.insert(entry);
    Overlay.of(context)?.insert(SnackbarManager.entries[0]);
  }

  void showErrorSnackbar(BuildContext context) {
    final _widget = copyWith(color: Theme.of(context).errorColor);
    show(context, _widget);
  }

  void showSucessSnackbar(BuildContext context) {
    final _widget = copyWith(color: Colors.green);
    show(context, _widget);
  }
}

class IsmailSnackbarState extends State<IsmailSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animDuration,
    );
    _animationController.forward().orCancel;
    timer = Timer(widget.duration, () async {
      await _animationController.reverse();
      SnackbarManager.dismiss(SnackbarManager.entries[0]);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: widget.animBuilder?.call(_animationController, _child) ??
          FadeSlideTransition(
            animation: _animationController,
            slide: Tween(
              begin: const Offset(0.0, .05),
              end: Offset.zero,
            ),
            child: _child,
          ),
    );
  }

  Widget get _child {
    return widget.child ??
        Card(
          color: widget.color,
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.text!),
          ),
        );
  }
}
