import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../src.dart';

/// A Scaffold widget that only returns the widget which you give when
/// the Platform isn't Desktop. In desktop it returns [DesktopTitleBar]
/// on top of the widget you provide by using the bitsdojo package.
class MainScaffold<T> extends StatelessWidget {
  const MainScaffold({
    Key? key,
    this.logo,
    required this.child,
  }) : super(key: key);

  /// logo for the [DesktopTitleBar]
  final T? logo;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (kIsWeb || !isDesktop) {
      return child;
    }

    return Stack(
      children: [
        Positioned.fill(child: child),
        DesktopTitleBar<T>(logo: logo),
      ],
    );
  }
}

/// A desktop title bar which is taken from the bitsdojo package also
/// when clicking on any part of the title bar it will open a customized
/// and functional exit ContextMenu [ContextMenu.exitMenu]. The [T] is used
/// for the logo which use the [DynamicImage] which will show a network image/
/// memory image/ asset image/ file image or even svg
class DesktopTitleBar<T> extends StatelessWidget {
  const DesktopTitleBar({
    Key? key,
    this.logo,
  }) : super(key: key);

  /// a logo that you can show at the most left of your title bar
  final T? logo;
  @override
  Widget build(BuildContext context) {
    return context.contextMenu.clickArea(
      callback: (contextMenu, event) {
        contextMenu.exitMenu(event.localPosition);
      },
      child: WindowTitleBarBox(
        child: Row(
          children: [
            if (logo != null)
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: DynamicImage<T?>(image: logo),
              ),
            Expanded(child: MoveWindow()),
            MinimizeWindowButton(animate: true),
            MaximizeWindowButton(animate: true),
            CloseWindowButton(animate: true),
          ],
        ),
      ),
    );
  }
}
