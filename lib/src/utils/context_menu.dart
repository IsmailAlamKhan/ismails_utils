import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../ismails_utils.dart';

class ContextMenu {
  final BuildContext context;
  ContextMenu.of(this.context);
  Future<T?> iconMenu<T>(Offset offset) {
    return open(
      offset: offset,
      size: const Size(180, 138),
      menu: (animation) => FadeScaleTransition(
        animation: animation,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              for (var fileIconMenu in fileIconMenuList)
                if (fileIconMenu.text == 'Close')
                  Column(
                    children: [
                      const Divider(height: 8),
                      _item(fileIconMenu),
                    ],
                  )
                else
                  _item(fileIconMenu),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(FileIconMenuModel fileIconMenu) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        fileIconMenu.onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(fileIconMenu.icon),
            20.sizedWidth,
            Text(fileIconMenu.text),
            const Spacer(),
            Text(fileIconMenu.hotKey ?? ''),
          ],
        ),
      ),
    );
  }

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
        /*
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => Stack(
            children: [
              Positioned(
                top: offset.dy,
                left: offset.dx,
                child: SizedBox.fromSize(size: size, child: menu(animation)),
              ),
            ],
          ),
          barrierColor: Colors.transparent,
          barrierDismissible: true,
          opaque: false,
          barrierLabel: '',
        ),
        */
      );
  Widget area({
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

List<FileIconMenuModel> fileIconMenuList = [
  FileIconMenuModel(
    icon: Icons.close_fullscreen,
    text: 'Minimize',
    onTap: () => appWindow.minimize(),
  ),
  FileIconMenuModel(
    icon: Icons.fullscreen,
    text: 'Maximize',
    onTap: () => appWindow.maximize(),
  ),
  FileIconMenuModel(
    icon: Icons.close,
    text: 'Close',
    hotKey: 'Alt+F4',
    onTap: () => appWindow.close(),
  ),
];

class _Route<T> extends PopupRoute<T> {
  _Route(this.page);
  final Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) page;
  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

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
  Duration get transitionDuration => const Duration(milliseconds: 100);
}
