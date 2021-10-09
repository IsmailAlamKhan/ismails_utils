import 'dart:async';

import 'package:flutter/material.dart';

import '../../ismails_utils.dart';

/// Conetext menus
class ContextMenu {
  /// main field of this class
  final BuildContext context;

  /// Conetext menus
  ContextMenu.of(this.context);

  /// Open a contextMenu
  Future<T?> open<T>({
    required Widget Function(Animation<double> animation) menu,
    Size? size,
    required Offset offset,
  }) =>
      Navigator.of(context).push(
        _Route(
          (context, animation, secondaryAnimation) => Stack(
            children: [
              Positioned(
                top: offset.dy,
                left: offset.dx,
                child: SizedBox.fromSize(size: size, child: menu(animation)),
              ),
            ],
          ),
        ),
      );

  /// clickArea to open a conextMenu
  Widget clickArea({
    required Widget child,
    required Function(
      ContextMenu contextMenu,
      PointerDownEvent event,
    )?
        callback,
  }) {
    return Listener(
      onPointerDown: (event) {
        if (event.mouseButton.rightClick) {
          callback?.call(this, event);
        }
      },
      child: child,
    );
  }
}

class FileIconMenuModel {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final String? hotKey;

  FileIconMenuModel({
    required this.text,
    required this.icon,
    required this.onTap,
    this.hotKey,
  });
}

class _Route<T> extends PopupRoute<T> {
  _Route(this.page, {this.barrierDismissible = true});

  @override
  bool barrierDismissible;
  final Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) page;
  @override
  Color? get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => 'Context Manu';

  @override
  Widget buildPage(
    BuildContext ctx,
    Animation<double> anim,
    Animation<double> secAnima,
  ) =>
      page(ctx, anim, secAnima);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
