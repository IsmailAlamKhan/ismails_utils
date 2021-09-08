import 'package:flutter/material.dart';

import '../../src.dart';

abstract class AlphabetListViewModel {
  final String firstChar;
  final String name;

  AlphabetListViewModel({required this.name, String? firstChar})
      : firstChar = firstChar ??
            (name.length > 1
                ? name[0].isAlphabetic
                    ? name[0]
                    : '#'
                : '');

  static List<AlphabetListViewModel> getListByFirstChar(String char, List<AlphabetListViewModel> list) {
    return list.where((e) => e.firstChar == char).toList();
  }
}

class StickyHeaderColor {
  final Color colorOne, colorTwo;
  StickyHeaderColor({required this.colorOne, required this.colorTwo});
}
