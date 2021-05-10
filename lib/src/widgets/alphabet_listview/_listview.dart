import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../src.dart';

class AlphabetListViewList<T extends AlphabetListViewModel>
    extends StatelessWidget {
  const AlphabetListViewList({
    Key? key,
    required this.itemBuilder,
    required this.list,
    required this.headerTheme,
    required this.headerBuilder,
  }) : super(key: key);

  /// {@macro ismails_utils.AlphabetListView.list}
  final List<T> list;

  /// {@macro ismails_utils.AlphabetListView.itemBuilder}
  final AlphabetListViewItemBuilder<T> itemBuilder;

  /// {@macro ismails_utils.AlphabetListView.headerBuilder}
  final AlphabetListViewHeaderBuilder? headerBuilder;

  /// {@macro ismails_utils.AlphabetListView.headerTheme}
  final AlphabetListviewTheme? headerTheme;

  @override
  Widget build(BuildContext context) {
    final controller = AlphabetListView.of(context).controller;

    return ScrollablePositionedList.builder(
      itemCount: controller.alphabets.length,
      itemScrollController: controller.itemScrollController,
      itemPositionsListener: controller.itemPositionsListener,
      padding: EdgeInsets.zero,
      itemBuilder: (context, i) {
        final alphabet = controller.alphabets[i];
        final _list =
            AlphabetListViewModel.getListByFirstChar(alphabet, list) as List<T>;
        if (_list.isEmpty) {
          return const SizedBox.shrink();
        }
        return StickyHeaderBuilder(
          builder: (context, stuckAmount) {
            stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
            return Theme(
              data: Theme.of(context).copyWith(
                cardTheme: headerTheme?.cardTheme,
              ),
              child: headerBuilder?.call(context, stuckAmount, alphabet) ??
                  Card(
                    margin: EdgeInsets.zero,
                    shape: const RoundedRectangleBorder(),
                    child: ListTile(
                      title: Text(alphabet, style: headerTheme?.textStyle),
                    ),
                  ),
            );
          },
          content: Column(
            children: [
              for (var i = 0; i < _list.length; i++)
                itemBuilder(context, _list, _list[i], i)
            ],
          ),
        );
      },
    );
  }
}
