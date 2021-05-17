import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../src.dart';

enum ScrollDirection { increase, decrease }

class CarouselBody extends StatefulWidget {
  const CarouselBody({
    Key? key,
    required this.allowImplicitScrolling,
    this.restorationId,
    required this.scrollDirection,
    required this.reverse,
    required this.controller,
    this.physics,
    required this.pageSnapping,
    this.onPageChanged,
    required this.childrenDelegate,
    required this.dragStartBehavior,
    required this.clipBehavior,
    required this.itemCount,
    this.customizer,
  }) : super(key: key);
  final bool allowImplicitScrolling;
  final String? restorationId;
  final Axis scrollDirection;
  final bool reverse;
  final IsmaiLCarouselController controller;
  final ScrollPhysics? physics;
  final bool pageSnapping;
  final ValueChanged<int>? onPageChanged;
  final SliverChildDelegate childrenDelegate;
  final DragStartBehavior dragStartBehavior;
  final Clip clipBehavior;
  final int itemCount;
  final IsmailCarouselIndicatorCustomizer? customizer;
  @override
  _CarouselBodyState createState() => _CarouselBodyState();
}

class _CarouselBodyState extends State<CarouselBody> {
  late Map<LogicalKeySet, Intent> shortcuts;
  late final Map<Type, Action<Intent>> actions = {
    ScrollIntent: ScrollAction(
      widget.controller,
      widget.customizer?.animationDuration,
    )
  };
  void initShortcuts() {
    if (widget.scrollDirection == Axis.horizontal) {
      shortcuts = {
        LogicalKeySet(LogicalKeyboardKey.arrowLeft):
            const ScrollIntent(ScrollDirection.decrease),
        LogicalKeySet(LogicalKeyboardKey.arrowRight):
            const ScrollIntent(ScrollDirection.increase),
      };
    } else {
      shortcuts = {
        LogicalKeySet(LogicalKeyboardKey.arrowDown):
            const ScrollIntent(ScrollDirection.increase),
        LogicalKeySet(LogicalKeyboardKey.arrowUp):
            const ScrollIntent(ScrollDirection.decrease),
      };
    }
  }

  @override
  void initState() {
    super.initState();
    initShortcuts();
  }

  @override
  void didUpdateWidget(CarouselBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollDirection != widget.scrollDirection) {
      initShortcuts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: shortcuts,
      child: Actions(
        actions: actions,
        child: Focus(
          autofocus: true,
          child: Listener(
            onPointerMove: (pointerMove) {
              if (pointerMove is PointerScrollEvent) {
                final offset = pointerMove.delta.dy * -1;
                ScrollDirection direction;
                if (offset > 0) {
                  direction = ScrollDirection.increase;
                } else {
                  direction = ScrollDirection.decrease;
                }
                widget.controller.scroll(
                  direction,
                  duration: widget.customizer?.animationDuration,
                );
              }
            },
            onPointerSignal: (pointerSignal) {
              if (pointerSignal is PointerScrollEvent) {
                final offset = pointerSignal.scrollDelta.dy;
                ScrollDirection direction;
                if (offset > 0) {
                  direction = ScrollDirection.increase;
                } else {
                  direction = ScrollDirection.decrease;
                }
                widget.controller.scroll(
                  direction,
                  duration: widget.customizer?.animationDuration,
                );
              }
            },
            child: _body,
          ),
        ),
      ),
    );
  }

  Widget get _body {
    return PageView.custom(
      childrenDelegate: widget.childrenDelegate,
      allowImplicitScrolling: widget.allowImplicitScrolling,
      clipBehavior: widget.clipBehavior,
      controller: widget.controller.pageController,
      dragStartBehavior: widget.dragStartBehavior,
      onPageChanged: (page) {
        widget.controller.pageListner(widget.itemCount);
        widget.onPageChanged?.call(page);
      },
      pageSnapping: widget.pageSnapping,
      physics: widget.physics,
      restorationId: widget.restorationId,
      reverse: widget.reverse,
      scrollDirection: widget.scrollDirection,
    );
  }
}

class ScrollIntent extends Intent {
  final ScrollDirection direction;
  const ScrollIntent(this.direction);
}

class ScrollAction extends Action<ScrollIntent> {
  ScrollAction(this.controller, [this.duration]);
  final IsmaiLCarouselController controller;
  final Duration? duration;
  @override
  void invoke(covariant ScrollIntent intent) {
    controller.scroll(intent.direction, duration: duration);
  }
}
