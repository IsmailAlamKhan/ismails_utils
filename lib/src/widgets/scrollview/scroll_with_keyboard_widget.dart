import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'scroll_with_keyboard_utils.dart';

class ScrollWithKeyboard extends StatelessWidget {
  const ScrollWithKeyboard({
    Key? key,
    required this.scrollController,
    required this.scrollView,
  }) : super(key: key);
  final ScrollController scrollController;
  final Widget scrollView;
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.arrowUp): const DecrementIntent(2),
        LogicalKeySet(LogicalKeyboardKey.arrowDown): const IncrementIntent(2),
      },
      manager: ShortcutManager(
        modal: true,
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.arrowUp): const DecrementIntent(2),
          LogicalKeySet(LogicalKeyboardKey.arrowDown): const IncrementIntent(2),
        },
      ),
      child: Actions(
        dispatcher: const ActionDispatcher(),
        actions: <Type, Action<Intent>>{
          IncrementIntent: IncrementAction(scrollController),
          DecrementIntent: DecrementAction(scrollController),
        },
        child: Focus(
          autofocus: true,
          child: Scrollbar(
            controller: scrollController,
            isAlwaysShown: true,
            child: scrollView,
          ),
        ),
      ),
    );
  }
}
