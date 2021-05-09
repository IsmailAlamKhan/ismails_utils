import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'scroll_with_keyboard_utils.dart';

/// This widget is specially for desktop and web it enables you to scroll
/// with your keyboard
class ScrollWithKeyboard extends StatefulWidget {
  const ScrollWithKeyboard({
    Key? key,
    this.scrollController,
    required this.scrollView,
  }) : super(key: key);
  final ScrollController? scrollController;
  final Widget scrollView;

  @override
  _ScrollWithKeyboardState createState() => _ScrollWithKeyboardState();
}

class _ScrollWithKeyboardState extends State<ScrollWithKeyboard> {
  late final scrollController = widget.scrollController ?? ScrollController();
  final shortcuts = {
    LogicalKeySet(LogicalKeyboardKey.arrowUp): const DecrementIntent(2),
    LogicalKeySet(LogicalKeyboardKey.arrowDown): const IncrementIntent(2),
  };

  Map<Type, Action<Intent>> actions(ScrollController scrollController) =>
      <Type, Action<Intent>>{
        IncrementIntent: IncrementAction(scrollController),
        DecrementIntent: DecrementAction(scrollController),
      };

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: shortcuts,
      manager: ShortcutManager(
        modal: true,
        shortcuts: shortcuts,
      ),
      child: Actions(
        dispatcher: const ActionDispatcher(),
        actions: actions(scrollController),
        child: Focus(
          autofocus: true,
          child: Scrollbar(
            controller: scrollController,
            isAlwaysShown: true,
            child: widget.scrollView,
          ),
        ),
      ),
    );
  }
}
