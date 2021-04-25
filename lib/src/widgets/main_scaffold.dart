import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../src.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    Key? key,
    required this.logo,
    required this.child,
  }) : super(key: key);
  final String logo;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (kIsWeb || !isDesktop) {
      return child;
    }

    return Stack(
      children: [
        Positioned.fill(child: child),
        DesktopTitleBar(logo: logo),
      ],
    );
  }
}

class DesktopTitleBar extends StatelessWidget {
  const DesktopTitleBar({
    Key? key,
    required this.logo,
  }) : super(key: key);
  final String logo;
  @override
  Widget build(BuildContext context) {
    return context.contextMenu.clickArea(
      callback: (contextMenu, event) {
        contextMenu.iconMenu(event.localPosition);
      },
      child: WindowTitleBarBox(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: DynamicImage(image: logo),
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
