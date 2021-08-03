import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:ismails_utils/ismails_utils.dart';

typedef ReorderAbleGridViewItemBuilder = Widget Function(bool isDragging);
typedef IndexedReorderAbleGridViewItemBuilder = Widget Function(
  BuildContext context,
  int index,
  bool isDragging,
);

class ReorderAbleGridView extends StatefulWidget {
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final SliverGridDelegate gridDelegate;
  final IndexedReorderAbleGridViewItemBuilder itemBuilder;
  final int? itemCount;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final ReorderCallback? onReorder;
  final bool isDraggalbe;

  const ReorderAbleGridView({
    Key? key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    required this.gridDelegate,
    required this.itemBuilder,
    this.itemCount,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.onReorder,
    this.isDraggalbe = true,
  }) : super(key: key);
  @override
  _ReorderAbleGridViewState createState() => _ReorderAbleGridViewState();
}

class _ReorderAbleGridViewState extends State<ReorderAbleGridView> {
  late final ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = widget.controller ?? ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: widget.gridDelegate,
      itemBuilder: (context, index) {
        if (!widget.isDraggalbe) {
          return widget.itemBuilder(context, index, false);
        }
        return _ReorderGridViewItem(
          index: index,
          item: (isDragging) => widget.itemBuilder(context, index, isDragging),
          scrollController: scrollController,
          onReorder: widget.onReorder,
        );
      },
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      addSemanticIndexes: widget.addSemanticIndexes,
      cacheExtent: widget.cacheExtent,
      dragStartBehavior: widget.dragStartBehavior,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      semanticChildCount: widget.semanticChildCount,
      clipBehavior: widget.clipBehavior,
      itemCount: widget.itemCount,
      padding: widget.padding,
      restorationId: widget.restorationId,
      controller: scrollController,
      physics: widget.physics,
      primary: widget.primary,
      shrinkWrap: widget.shrinkWrap,
    );
  }
}

class _ReorderGridViewItem extends StatefulWidget {
  const _ReorderGridViewItem({
    Key? key,
    required this.index,
    this.onReorder,
    required this.item,
    required this.scrollController,
  }) : super(key: key);
  final int index;
  final ReorderCallback? onReorder;
  final ReorderAbleGridViewItemBuilder item;
  final ScrollController scrollController;
  @override
  __ReorderGridViewItemState createState() => __ReorderGridViewItemState();
}

class __ReorderGridViewItemState extends State<_ReorderGridViewItem> {
  int get index => widget.index;
  Widget get item => widget.item(isDragging);
  int draggingIndex = -1;
  bool isDragging = false;
  double height = 0, width = 0;
  bool isScrolling = false;
  void autoScroll(double deviceHeight, double currentDragPos) {
    if (isScrolling) return;
    double? offset;
    IsmailLogger().info('$currentDragPos ');
    if (currentDragPos >= deviceHeight - 100) {
      offset = widget.scrollController.offset + 200;
    } else if (currentDragPos <= 100) {
      offset = widget.scrollController.offset - 200;
    }
    if (offset != null) {
      isScrolling = true;
      widget.scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      isScrolling = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _widget = DragTarget<int>(
      onAccept: (data) {
        if (draggingIndex != index) {
          widget.onReorder?.call(data, index);
        }
      },
      builder: (context, candidateData, rejectedData) {
        return LayoutBuilder(builder: (context, constraints) {
          if (!isDragging) {
            height = constraints.maxHeight;
            width = constraints.maxWidth;
          }
          return SizedBox(
            height: height,
            width: width,
            child: item,
          );
        });
      },
    );
    return LongPressDraggable<int>(
      onDragStarted: () => setState(() {
        isDragging = true;
        draggingIndex = index;
      }),
      onDragEnd: (_) => setState(() {
        isDragging = false;
        draggingIndex = -1;
      }),
      onDragUpdate: (details) {
        final deviceHeight = MediaQuery.of(context).size.height;
        autoScroll(
          deviceHeight,
          details.globalPosition.dy -
              (kToolbarHeight + MediaQuery.of(context).viewInsets.top),
        );
      },
      data: index,
      feedback: _widget,
      child: _widget,
      childWhenDragging: const SizedBox.shrink(),
    );
  }
}
