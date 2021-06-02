import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../src.dart';

final _defaultController = IsmaiLCarouselController();

/// {@template IsmailCarousel}
/// A carousel widget which can be scrolled by swipping which is obvious, but
/// it can also be scrolled with Mouse wheel and keyboard
/// {@endtemplate}

class IsmailCarousel extends StatefulWidget {
  /// @{@macro IsmailCarousel}
  IsmailCarousel({
    Key? key,
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    IsmaiLCarouselController? controller,
    this.physics,
    this.pageSnapping = true,
    this.onPageChanged,
    List<Widget> children = const <Widget>[],
    this.dragStartBehavior = DragStartBehavior.start,
    this.allowImplicitScrolling = false,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.scrollBehavior,
    this.wantIndicator = true,
    this.indicatorCustomizer,
  })  : childrenDelegate = SliverChildListDelegate(children),
        itemCount = children.length,
        controller = controller ?? _defaultController,
        super(key: key);

  IsmailCarousel.builder({
    Key? key,
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    IsmaiLCarouselController? controller,
    this.physics,
    this.pageSnapping = true,
    this.onPageChanged,
    this.dragStartBehavior = DragStartBehavior.start,
    this.allowImplicitScrolling = false,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.scrollBehavior,
    required IndexedWidgetBuilder builder,
    this.wantIndicator = true,
    this.indicatorCustomizer,
    required this.itemCount,
  })  : childrenDelegate = SliverChildBuilderDelegate((ctx, index) {
          final _item = itemCount.loop(index);
          return builder(ctx, _item);
        }),
        controller = controller ?? _defaultController,
        super(key: key);

  /// Controls whether the widget's pages will respond to
  /// [RenderObject.showOnScreen], which will allow for implicit accessibility
  /// scrolling.
  ///
  /// With this flag set to false, when accessibility focus reaches the end of
  /// the current page and the user attempts to move it to the next element, the
  /// focus will traverse to the next widget outside of the page view.
  ///
  /// With this flag set to true, when accessibility focus reaches the end of
  /// the current page and user attempts to move it to the next element, focus
  /// will traverse to the next page in the page view.
  final bool allowImplicitScrolling;

  /// {@macro flutter.widgets.scrollable.restorationId}
  final String? restorationId;

  /// The axis along which the page view scrolls.
  ///
  /// Defaults to [Axis.horizontal].
  final Axis scrollDirection;

  /// Whether the page view scrolls in the reading direction.
  ///
  /// For example, if the reading direction is left-to-right and
  /// [scrollDirection] is [Axis.horizontal], then the page view scrolls from
  /// left to right when [reverse] is false and from right to left when
  /// [reverse] is true.
  ///
  /// Similarly, if [scrollDirection] is [Axis.vertical], then the page view
  /// scrolls from top to bottom when [reverse] is false and from bottom to top
  /// when [reverse] is true.
  ///
  /// Defaults to false.
  final bool reverse;

  /// An object that can be used to control the position to which this page
  /// view is scrolled.
  final IsmaiLCarouselController controller;

  /// How the page view should respond to user input.
  ///
  /// For example, determines how the page view continues to animate after the
  /// user stops dragging the page view.
  ///
  /// The physics are modified to snap to page boundaries using
  /// [PageScrollPhysics] prior to being used.
  ///
  /// If an explicit [ScrollBehavior] is provided to [scrollBehavior], the
  /// [ScrollPhysics] provided by that behavior will take precedence after
  /// [physics].
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? physics;

  /// Set to false to disable page snapping, useful for custom scroll behavior.
  final bool pageSnapping;

  /// Called whenever the page in the center of the viewport changes.
  final ValueChanged<int>? onPageChanged;

  /// A delegate that provides the children for the [PageView].
  ///
  /// The [PageView.custom] constructor lets you specify this delegate
  /// explicitly. The [PageView] and [PageView.builder] constructors create a
  /// [childrenDelegate] that wraps the given [List] and [IndexedWidgetBuilder],
  /// respectively.
  final SliverChildDelegate childrenDelegate;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip clipBehavior;

  /// {@macro flutter.widgets.shadow.scrollBehavior}
  ///
  /// [ScrollBehavior]s also provide [ScrollPhysics]. If an explicit
  /// [ScrollPhysics] is provided in [physics], it will take precedence,
  /// followed by [scrollBehavior], and then the inherited ancestor
  /// [ScrollBehavior].
  ///
  /// The [ScrollBehavior] of the inherited [ScrollConfiguration] will be
  /// modified by default to not apply a [Scrollbar].
  final ScrollBehavior? scrollBehavior;

  /// If you want an indicator or not
  final bool wantIndicator;

  /// To customize the indicator
  final IsmailCarouselIndicatorCustomizer? indicatorCustomizer;

  /// Gets the item count for the indicator
  final int itemCount;

  @override
  _IsmailCarouselState createState() => _IsmailCarouselState();
}

class _IsmailCarouselState extends State<IsmailCarousel> {
  late IsmaiLCarouselController _controller;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void didUpdateWidget(IsmailCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _controller = widget.controller;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.wantIndicator) {
      return _body(_controller);
    }
    IsmailCarouselIndicatorCustomizer customizer;
    final IsmailCarouselIndicatorCustomizer _customizer =
        widget.indicatorCustomizer ??
            IsmailCarouselIndicatorCustomizer(
              activeColor: Theme.of(context).primaryColor,
              inActiveColor: Theme.of(context).disabledColor,
              height: 10,
            );
    if (widget.scrollDirection == Axis.vertical) {
      customizer = _customizer.copyWith(
        position: _customizer.position.copyWith(left: 10),
      );
    } else {
      customizer = _customizer.copyWith();
    }
    final position = customizer.position;
    return _controller.builder<IsmaiLCarouselController>(
      (_, controller, __) => Stack(
        children: [
          _body(controller, customizer),
          Positioned(
            bottom: position.bottom,
            left: position.left,
            right: position.right,
            top: position.top,
            child: Center(
              child: Builder(
                builder: (_) {
                  if (widget.scrollDirection == Axis.vertical) {
                    return RotatedBox(
                      quarterTurns: 1,
                      child: _indicatorBody(customizer, controller),
                    );
                  }
                  return _indicatorBody(customizer, controller);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicatorBody(
    IsmailCarouselIndicatorCustomizer customizer,
    final IsmaiLCarouselController controller,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < widget.itemCount; i++)
          _indicator(i, customizer, controller)
      ],
    );
  }

  Widget _indicator(
    final int index,
    final IsmailCarouselIndicatorCustomizer customizer,
    final IsmaiLCarouselController controller,
  ) {
    final bool isActive = controller.active(index);
    return customizer.builder?.call(context, index, customizer, controller) ??
        IsmailCarouselIndicator(
          isActive: isActive,
          customizer: customizer,
        );
  }

  Widget _body(
    final IsmaiLCarouselController controller, [
    IsmailCarouselIndicatorCustomizer? customizer,
  ]) {
    return CarouselBody(
      customizer: customizer,
      itemCount: widget.itemCount,
      childrenDelegate: widget.childrenDelegate,
      allowImplicitScrolling: widget.allowImplicitScrolling,
      clipBehavior: widget.clipBehavior,
      controller: controller,
      dragStartBehavior: widget.dragStartBehavior,
      onPageChanged: widget.onPageChanged,
      pageSnapping: widget.pageSnapping,
      physics: widget.physics,
      restorationId: widget.restorationId,
      reverse: widget.reverse,
      scrollDirection: widget.scrollDirection,
    );
  }
}
