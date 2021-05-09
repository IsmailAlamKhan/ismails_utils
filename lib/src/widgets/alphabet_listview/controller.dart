import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../src.dart';

class AlphabetController<T extends AlphabetListViewModel>
    extends ChangeNotifier {
  final List<T> list;
  late ItemScrollController itemScrollController;
  late ItemPositionsListener itemPositionsListener;
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }

  List<String> get alphabets => list.map((e) => e.firstChar).toSet().toList();
  AlphabetController(this.list) {
    init();
  }

  void init() {
    itemScrollController = ItemScrollController();
    itemPositionsListener = ItemPositionsListener.create();
    itemPositionsListener.itemPositions.addListener(_listner);
  }

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

  void scrollTo(int i) {
    itemScrollController.scrollTo(
      index: i,
      duration: const Duration(milliseconds: 500),
    );
  }
}

class AlphabetListViewInheritedWidget extends InheritedWidget {
  final AlphabetController controller;
  const AlphabetListViewInheritedWidget({
    required Widget child,
    required this.controller,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_) => false;
}
