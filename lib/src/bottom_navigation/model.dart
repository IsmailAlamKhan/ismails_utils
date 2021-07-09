part of bottom_navigation;

@immutable
class BottomNavigationItem {
  final String label;
  final String url;
  final Widget icon;
  final WidgetBuilder widget;
  final PageTransitionSwitcherTransitionBuilder? transitionsBuilder;
  final NavigatorKey? navKey;
  final Duration transitionDuration;
  const BottomNavigationItem({
    required this.label,
    final String? url,
    required this.icon,
    required this.widget,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.transitionsBuilder,
    this.navKey,
  }) : url = url ?? label;
}
