import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'scroll_with_keyboard_utils.dart';

class ScrollWithKeyboard extends StatelessWidget {
  ScrollWithKeyboard({
    Key? key,
    required this.scrollController,
    required this.scrollView,
  }) : super(key: key);
  final ScrollController scrollController;
  final Widget scrollView;

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
            child: scrollView,
          ),
        ),
      ),
    );
  }
}
