import 'package:flutter/material.dart';

/// {@template animatedCard}
/// Animated Version of the card which animates automatically when the params
/// change
/// {@endtemplate}
class AnimatedCard extends ImplicitlyAnimatedWidget {
  /// {@macro animatedCard}
  const AnimatedCard({
    Key? key,

    /// the duration of the animation
    Duration? duration,

    /// the curve of the animation
    Curve? curve,
    this.color,
    this.shadowColor,
    this.elevation,
    this.shape,
    this.borderOnForeground = true,
    this.margin,
    this.clipBehavior,
    this.child,
    this.semanticContainer = true,
  }) : super(
          key: key,
          duration: duration ?? const Duration(milliseconds: 500),
          curve: curve ?? Curves.easeIn,
        );

  /// The card's background color.
  ///
  /// Defines the card's [Material.color].
  ///
  /// If this property is null then [CardTheme.color] of [ThemeData.cardTheme]
  /// is used. If that's null then [ThemeData.cardColor] is used.
  final Color? color;

  /// The color to paint the shadow below the card.
  ///
  /// If null then the ambient [CardTheme]'s shadowColor is used.
  /// If that's null too, then the overall theme's [ThemeData.shadowColor]
  /// (default black) is used.
  final Color? shadowColor;

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  ///
  /// Defines the card's [Material.elevation].
  ///
  /// If this property is null then [CardTheme.elevation] of
  /// [ThemeData.cardTheme] is used. If that's null, the default value is 1.0.
  final double? elevation;

  /// The shape of the card's [Material].
  ///
  /// Defines the card's [Material.shape].
  ///
  /// If this property is null then [CardTheme.shape] of [ThemeData.cardTheme]
  /// is used. If that's null then the shape will be a [RoundedRectangleBorder]
  /// with a circular corner radius of 4.0.
  final ShapeBorder? shape;

  /// Whether to paint the [shape] border in front of the [child].
  ///
  /// The default value is true.
  /// If false, the border will be painted behind the [child].
  final bool borderOnForeground;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// If this property is null then [CardTheme.clipBehavior] of
  /// [ThemeData.cardTheme] is used. If that's null then the behavior will be [Clip.none].
  final Clip? clipBehavior;

  /// The empty space that surrounds the card.
  ///
  /// Defines the card's outer [Container.margin].
  ///
  /// If this property is null then [CardTheme.margin] of
  /// [ThemeData.cardTheme] is used. If that's null, the default margin is 4.0
  /// logical pixels on all sides: `EdgeInsets.all(4.0)`.
  final EdgeInsetsGeometry? margin;

  /// Whether this widget represents a single semantic container, or if false
  /// a collection of individual semantic nodes.
  ///
  /// Defaults to true.
  ///
  /// Setting this flag to true will attempt to merge all child semantics into
  /// this node. Setting this flag to false will force all child semantic nodes
  /// to be explicit.
  ///
  /// This flag should be false if the card contains multiple different types
  /// of content.
  final bool semanticContainer;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;
  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends AnimatedWidgetBaseState<AnimatedCard> {
  late CardTheme widgetCardTheme = const CardTheme();
  @override
  void initState() {
    fillCardThemeAccordingToThemeOrFromWidget();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    fillCardThemeAccordingToThemeOrFromWidget(context);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(AnimatedCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    fillCardThemeAccordingToThemeOrFromWidget(context);
  }

  void fillCardThemeAccordingToThemeOrFromWidget([BuildContext? ctx]) {
    if (ctx == null) {
      widgetCardTheme = CardTheme(
        clipBehavior: widget.clipBehavior,
        color: widget.color,
        elevation: widget.elevation,
        margin: widget.margin,
        shadowColor: widget.shadowColor,
        shape: widget.shape,
      );
    } else {
      final _cardTheme = Theme.of(ctx).cardTheme;
      widgetCardTheme = CardTheme(
        clipBehavior: widget.clipBehavior ?? _cardTheme.clipBehavior,
        color: widget.color ?? _cardTheme.color,
        elevation: widget.elevation ?? _cardTheme.elevation,
        margin: widget.margin ?? _cardTheme.margin,
        shadowColor: widget.shadowColor ?? _cardTheme.shadowColor,
        shape: widget.shape ?? _cardTheme.shape,
      );
    }
  }

  _CardThemeTween? _data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: _data!.evaluate(animation).color,
      elevation: _data!.evaluate(animation).elevation,
      shadowColor: _data!.evaluate(animation).shadowColor,
      shape: _data!.evaluate(animation).shape,
      clipBehavior: _data!.evaluate(animation).clipBehavior,
      margin: _data!.evaluate(animation).margin,
      semanticContainer: widget.semanticContainer,
      borderOnForeground: widget.borderOnForeground,
      child: widget.child,
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _data = visitor(
      _data,
      widgetCardTheme,
      (begin) => _CardThemeTween(begin: begin),
    ) as _CardThemeTween?;
  }
}

class _CardThemeTween extends Tween<CardTheme> {
  _CardThemeTween({CardTheme? begin, CardTheme? end})
      : super(begin: begin, end: end);

  @override
  CardTheme lerp(double t) => CardTheme.lerp(begin, end, t);
}
