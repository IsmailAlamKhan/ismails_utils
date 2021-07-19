part of bottom_navigation;

class BottomNavigationController extends ChangeNotifier with IsmailLoggerMixin {
  BottomNavigationController(this.pageList);
  final List<BottomNavigationItem> pageList;

  bool _isGoingBack = false;
  bool get isGoingBack => _isGoingBack;

  BottomNavigationItem get activeItem => pageList[activeIndex];

  int _currentIndex = 0;
  int get activeIndex => _currentIndex;
  set activeIndex(int newIndex) {
    _isGoingBack = newIndex < activeIndex;
    logInfo(
      'Going ${_isGoingBack ? 'back' : ''} from $_currentIndex to $newIndex',
    );
    _currentIndex = newIndex;
    notifyListeners();
  }

  void navigateTo(int index) => activeIndex = index;
  bool get canPopOut => activeIndex == 0 && !nestedNavsCanPop;

  bool get nestedNavsCanPop =>
      activeItem.navKey?.currentState?.canPop() ?? false;

  static BottomNavigationController of(BuildContext context) {
    try {
      return context
          .dependOnInheritedWidgetOfExactType<_BottomNavigationScope>()!
          .notifier!;
    } catch (e) {
      throw notFoundOnScopeError('BottomNavigation');
    }
  }

  Future<bool> onWillPop() async {
    _isGoingBack = true;
    if (canPopOut) return true;
    if (!nestedNavsCanPop) {
      activeIndex--;
      return false;
    } else {
      unawaited(activeItem.navKey!.currentState!.maybePop());
      return false;
    }
  }
}

class _BottomNavigationScope
    extends InheritedNotifier<BottomNavigationController> {
  const _BottomNavigationScope({
    Key? key,
    required Widget child,
    required BottomNavigationController notifier,
  }) : super(child: child, key: key, notifier: notifier);

  static Widget build({
    required WidgetBuilder builder,
    required BottomNavigationController notifier,
  }) {
    return _BottomNavigationScope(
      notifier: notifier,
      child: Builder(builder: builder),
    );
  }
}
