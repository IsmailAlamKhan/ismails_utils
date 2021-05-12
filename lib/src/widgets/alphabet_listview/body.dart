import 'package:flutter/material.dart';
import 'package:graphx/graphx.dart';

import '../../src.dart';
import '_listview.dart';
import '_sidebar.dart';

/// Makes a list view that you can scroll to each index using alphabets on the
/// right
class AlphabetListView<T extends AlphabetListViewModel> extends StatefulWidget {
  /// Makes a list view that you can scroll to each index using alphabets on the
  /// right
  const AlphabetListView({
    Key? key,
    required this.list,
    required this.itemBuilder,
    this.headerBuilder,
    this.headerTheme,
    this.sideBarTheme,
    this.sideBarItemBuilder,
  }) : super(key: key);

  /// {@template ismails_utils.AlphabetListView.list}
  /// the item which you want to show typically a [ListTile]
  /// List which you would provide the list of the items must extend [AlphabetListViewModel]
  /// otherwise the listview won't get the alphabets
  /// {@endtemplate}
  final List<T> list;

  /// {@template ismails_utils.AlphabetListView.itemBuilder}
  /// the item which you want to show typically a [ListTile]
  /// {@endtemplate}
  final AlphabetListViewItemBuilder<T> itemBuilder;

  /// {@template ismails_utils.AlphabetListView.headerBuilder}
  /// This will be shown as the header of the items which will contain the alphabet
  /// of that part by default a card will be show which you can customize using
  /// the [AlphabetListView.headerTheme]
  /// Builder called during layout to allow the header's
  /// content to be animated or styled based
  /// on the amount of stickiness the header has.
  ///
  /// [context] for your build operation.
  ///
  /// [stuckAmount] will have the value of:
  /// ```
  ///   0.0 <= value <= 1.0: about to be stuck
  ///          0.0 == value: at top
  ///  -1.0 >= value >= 0.0: past stuck
  /// ```
  ///
  /// {@endtemplate}
  final AlphabetListViewHeaderBuilder? headerBuilder;

  /// {@template ismails_utils.AlphabetListView.headerTheme}
  /// The theme to modify the header for more customization of the header use
  /// [AlphabetListView.headerBuilder] with which you can provide a completly
  /// custom Header you can't customize the shape with this.
  /// {@endtemplate}
  final AlphabetListviewTheme? headerTheme;

  /// {@template ismails_utils.AlphabetListView.sideBarTheme}
  /// The theme to modify the sideBarTheme for more customization of the sideBarTheme
  ///  use [AlphabetListView.sideBarItemBuilder] with which you can provide a completly
  /// custom sideBarTheme you can't customize the shape with this.
  /// {@endtemplate}
  final AlphabetListviewTheme? sideBarTheme;

  /// {@template ismails_utils.AlphabetListView.sideBarItemBuilder}
  /// This will be shown as the sidebar which will contain the alphabets
  /// by clicking any of it you can scroll to that index if you want to
  /// change the color of the sidebar use the [AlphabetListView.sideBarTheme]
  /// {@endtemplate}
  final AlphabetListViewSideBarBuilder? sideBarItemBuilder;

  @override
  _AlphabetListViewState<T> createState() => _AlphabetListViewState<T>();

  /// Gives the InheritedWidget this widget injects to get the [AlphabetController]
  /// which is a [ChangeNotifier]
  static AlphabetListViewInheritedWidget of(BuildContext context) {
    try {
      return context.dependOnInheritedWidgetOfExactType<
          AlphabetListViewInheritedWidget>()!;
    } catch (e) {
      throw 'To use AlphabetListView.of(context) the BuildContext '
          'must be a decendant of AlphabetListView';
    }
  }
}

class _AlphabetListViewState<T extends AlphabetListViewModel>
    extends State<AlphabetListView<T>> {
  late final AlphabetController _controller = AlphabetController(widget.list);

  @override
  Widget build(BuildContext context) {
    return AlphabetListViewInheritedWidget(
      controller: _controller,
      child: Builder(
        builder: (context) {
          final inheritedWidget = AlphabetListView.of(context);
          final controller = inheritedWidget.controller;
          return Row(
            children: [
              Expanded(
                child: AlphabetListViewList<T>(
                  headerTheme: widget.headerTheme,
                  itemBuilder: widget.itemBuilder,
                  headerBuilder: widget.headerBuilder,
                  list: widget.list,
                ),
              ),
              SideBar(
                controller: controller,
                sideBarItemBuilder: widget.sideBarItemBuilder,
                sideBarTheme: widget.sideBarTheme,
              ),
            ],
          );
        },
      ),
    );
  }
}
