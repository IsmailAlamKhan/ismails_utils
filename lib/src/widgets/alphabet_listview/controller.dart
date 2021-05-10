import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../src.dart';

/// The ChangeNotifier class that [AlphabetListView] uses to controll the state
class AlphabetController<T extends AlphabetListViewModel>
    extends ChangeNotifier {
  /// The ChangeNotifier class that [AlphabetListView] uses to controll the state
  AlphabetController(this.list) {
    init();
  }

  /// The list which gets rendered after the headers
  final List<T> list;

  /// The ScrollController which is used to achive the scroll to index
  /// functionality when clicking the alphabet on the sidebar.
  /// This from the [https://pub.dev/packages/scrollable_positioned_list] package
  late ItemScrollController itemScrollController;

  /// The ScrollListner which is used to get the currentindex
  /// of the scrollview.
  /// This from the [https://pub.dev/packages/scrollable_positioned_list] package
  late ItemPositionsListener itemPositionsListener;
  int _currentIndex = 0;

  /// Get the currentindex of the scrollview
  int get currentIndex => _currentIndex;

  /// set the currentindex of the scrollview
  set currentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }

  /// List of the alphabets that is got from the provided list
  List<String> get alphabets => list.map((e) => e.firstChar).toSet().toList();

  /// Function to init the scrollControllers and listners
  void init() {
    itemScrollController = ItemScrollController();
    itemPositionsListener = ItemPositionsListener.create();
    itemPositionsListener.itemPositions.addListener(_listner);
  }

  /// The scroll Listner
  void _listner() {
    final items = itemPositionsListener.itemPositions.value;
    if (items.isNotEmpty) {
      currentIndex = items.first.index;
    }
  }

  @override
  void dispose() {
    itemPositionsListener.itemPositions.removeListener(_listner);
    super.dispose();
  }

  /// ScrollToIndex
  void scrollTo(int i) {
    itemScrollController.scrollTo(
      index: i,
      duration: const Duration(milliseconds: 500),
    );
  }
}

/// The InheritedWidget that is injected on [AlphabetListView] to
/// acccess the [AlphabetController]
class AlphabetListViewInheritedWidget extends InheritedWidget {
  /// the [AlphabetController] which has the all the state of the [AlphabetListView]
  final AlphabetController controller;

  /// The InheritedWidget that is injected on [AlphabetListView] to
  /// acccess the [AlphabetController]
  const AlphabetListViewInheritedWidget({
    required Widget child,
    required this.controller,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_) => false;
}
