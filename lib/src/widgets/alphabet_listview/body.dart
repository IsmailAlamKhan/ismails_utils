import 'package:flutter/material.dart';
import 'package:graphx/graphx.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../../src.dart';

/// Makes a list view that you can scroll to each index using
class AlphabetListView<T extends AlphabetListViewModel> extends StatefulWidget {
  const AlphabetListView({
    Key? key,
    required this.list,
    required this.itemBuilder,
    this.stickyHeaderColor,
  }) : super(key: key);
  final List<T> list;
  final AlphabetListViewItemBuilder<T> itemBuilder;
  final Color Function(double stuckAmmount)? stickyHeaderColor;

  @override
  _AlphabetListViewState<T> createState() => _AlphabetListViewState<T>();
  static AlphabetListViewInheritedWidget? of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<AlphabetListViewInheritedWidget>();
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
          return Stack(
            children: [
              Positioned(
                left: 0,
                right: 20,
                top: 0,
                bottom: 0,
                child: _build(inheritedWidget!.controller),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Material(
                  elevation: 6,
                  child: SizedBox(
                    width: 20,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var i = 0;
                                i < inheritedWidget.controller.alphabets.length;
                                i++)
                              AlphabetItem(i: i),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _build(AlphabetController controller) {
    return ScrollablePositionedList.builder(
      itemCount: controller.alphabets.length,
      itemScrollController: controller.itemScrollController,
      itemPositionsListener: controller.itemPositionsListener,
      padding: EdgeInsets.zero,
      itemBuilder: (context, i) {
        final alphabet = controller.alphabets[i];
        final _list =
            AlphabetListViewModel.getListByFirstChar(alphabet, widget.list)
                as List<T>;
        if (_list.isEmpty) {
          return const SizedBox.shrink();
        }
        return StickyHeaderBuilder(
          builder: (context, stuckAmount) {
            stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
            return Material(
              elevation: 6,
              // color: UppPallete.kAppbarBg,
              color: widget.stickyHeaderColor?.call(stuckAmount),
              child: ListTile(
                title: Text(
                  alphabet,
                  style: context.textTheme.headline4,
                ),
              ),
            );
          },
          content: Column(
            children: [
              for (var i = 0; i < _list.length; i++)
                widget.itemBuilder(context, _list, _list[i], i)
            ],
          ),
        );
      },
    );
  }
}

class AlphabetItem extends StatelessWidget {
  const AlphabetItem({
    Key? key,
    required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    final controller = AlphabetListView.of(context)!.controller;
    return GestureDetector(
      onTap: () => controller.scrollTo(i),
      child: controller.builder(
        (_) => Text(
          controller.alphabets[i],
          style: context.textTheme.headline6!.copyWith(
            color: i == controller.currentIndex
                ? context.theme.primaryColor
                : null,
          ),
        ),
      ),
    );
  }
}
