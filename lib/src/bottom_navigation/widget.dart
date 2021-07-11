part of bottom_navigation;

typedef BottomNavigationBuilder = Widget Function(
  BuildContext context,
  BottomNavigationController controller,
);

typedef BottomNavigationBodyBuilder = Widget Function(
  BuildContext context,
  Widget bottomNavbar,
  Widget body,
);

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key? key,
    this.bottomNavBuilder,
    this.body,
    this.builder,
    required this.pageList,
  }) : super(key: key);
  final BottomNavigationBuilder? bottomNavBuilder, body;
  final List<BottomNavigationItem> pageList;
  final BottomNavigationBodyBuilder? builder;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late final BottomNavigationController notifier;
  @override
  void initState() {
    super.initState();
    notifier = BottomNavigationController(widget.pageList);
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BottomNavigationScope.build(
      notifier: notifier,
      builder: (context) {
        final controller = BottomNavigationController.of(context);
        final body = PageTransitionSwitcher(
          duration: controller.activeItem.transitionDuration,
          reverse: controller.isGoingBack,
          transitionBuilder: controller.activeItem.transitionsBuilder ??
              (child, animation, secondaryAnimation) => FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    fillColor: Colors.transparent,
                    child: child,
                  ),
          child: SizedBox(
            key: ValueKey(controller.activeIndex),
            child: controller.activeItem.widget(context),
          ),
        );
        return WillPopScope(
          onWillPop: controller.onWillPop,
          child: Scaffold(
            body: body,
            bottomNavigationBar: widget.bottomNavBuilder?.call(
                  context,
                  controller,
                ) ??
                BottomNavigationBar(
                  items: widget.pageList
                      .map(
                        (page) => BottomNavigationBarItem(
                          icon: page.icon,
                          label: page.label,
                        ),
                      )
                      .toList(),
                  currentIndex: controller.activeIndex,
                  onTap: controller.navigateTo,
                ),
          ),
        );
      },
    );
  }
}
