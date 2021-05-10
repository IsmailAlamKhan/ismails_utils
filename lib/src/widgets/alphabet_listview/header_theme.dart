import 'package:flutter/material.dart';

import '../../src.dart';

/// This is class is to provide theme to the [AlphabetListView.headerTheme] and
/// [AlphabetListView.sideBarTheme]
class AlphabetListviewTheme {
  /// For the background or the Card's color the [AlphabetListView] uses
  /// as the header and the side bar
  final CardTheme? cardTheme;

  /// For the textstyle of the header it uses the [ListTile.title] to show
  /// the title and the for the side bar uses
  /// [Theme.of(context).textTheme.headline6]
  final TextStyle? textStyle;

  /// The active item color of the sidebar by default uses
  /// [Theme.of(context).primaryColor]
  final Color? sideBarActiveItemColor;

  /// This is class is to provide theme to the [AlphabetListView.headerTheme] and
  /// [AlphabetListView.sideBarTheme]
  AlphabetListviewTheme({
    this.cardTheme,
    this.textStyle,
    this.sideBarActiveItemColor,
  });
}
