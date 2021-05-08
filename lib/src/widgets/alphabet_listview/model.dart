import 'package:flutter/material.dart';

import '../../src.dart';

abstract class AlphabetListViewModel {
  String get firstChar => name.length > 1
      ? name[0].isAlphabetic
          ? name[0]
          : '#'
      : '';
  final String name;

  AlphabetListViewModel({required this.name});

  static List<AlphabetListViewModel> getListByFirstChar(
    String char,
    List<AlphabetListViewModel> list,
  ) {
    return list.where((e) => e.firstChar == char).toList();
  }
}

class StickyHeaderColor {
  final Color colorOne, colorTwo;
  StickyHeaderColor({
    required this.colorOne,
    required this.colorTwo,
  });
}
