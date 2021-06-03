import 'package:flutter/material.dart';

import '../src.dart';

class SlimySwitch extends StatefulWidget {
  SlimySwitch({
    Key? key,
    required this.size,
    required this.currentIndex,
    required this.items,
    this.onChanged,
    this.activeColor,
    this.padding = 10,
    final double? buttonWidth,
  })  : itemCount = items.length,
        super(key: key) {
    this.buttonWidth = buttonWidth ?? (size.width / itemCount);
  }
  final Size size;
  late final double buttonWidth;
  final int currentIndex;
  final ValueChanged<int>? onChanged;
  final List<String> items;
  final int itemCount;
  final Color? activeColor;
  final double padding;
  @override
  _SlimySwitchState createState() => _SlimySwitchState();
}

class _SlimySwitchState extends State<SlimySwitch> with Logger {
  final duration = const Duration(milliseconds: 500);
  late Color? activeColor = widget.activeColor;
  int get currentIndex => widget.currentIndex;
  double _postion(bool isLeft) {
    return currentIndex == (isLeft ? 0 : 1) ? 0 : widget.buttonWidth;
  }

  @override
  Widget build(BuildContext context) {
    activeColor ??= Theme.of(context).primaryColor;
    return Center(
      child: SizedBox.fromSize(
        size: widget.size,
        child: AnimatedContainer(
          duration: duration,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: activeColor!),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: duration,
                left: _postion(true),
                right: _postion(false),
                child: Builder(builder: (context) {
                  logger.info(widget.buttonWidth);
                  return Container(
                    width: widget.buttonWidth,
                    height: widget.size.height,
                    decoration: BoxDecoration(
                      color: activeColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ),
              Row(
                children: widget.items.map(
                  (e) {
                    final index = widget.items.indexOf(e);
                    return Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: index == widget.currentIndex
                              ? null
                              : () {
                                  widget.onChanged?.call(index);
                                },
                          child: Center(child: Text(e)),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
