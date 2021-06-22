import 'package:flutter/material.dart';

import '../src.dart';

typedef SlimyIndicatorBuilder = Widget Function(
  BuildContext context,
  int index,
  GestureTapCallback? onChange,
);

class SlimySwitch extends StatefulWidget {
  SlimySwitch({
    Key? key,
    required this.size,
    required this.currentIndex,
    required this.items,
    this.onChanged,
    this.activeColor,
    this.padding = 10,
    this.builder,
    this.duration = const Duration(milliseconds: 500),
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
  final Duration duration;
  final SlimyIndicatorBuilder? builder;
  @override
  _SlimySwitchState createState() => _SlimySwitchState();
}

class _SlimySwitchState extends State<SlimySwitch> with Logger {
  int get currentIndex => widget.currentIndex;
  double _postion(bool isLeft) {
    return currentIndex == (isLeft ? 0 : 1) ? 0 : widget.buttonWidth;
  }

  @override
  Widget build(BuildContext context) {
    Color activeColor;
    if (currentIndex == 0) {
      activeColor = widget.activeColor ?? Theme.of(context).primaryColor;
    } else {
      activeColor = widget.activeColor ?? Theme.of(context).accentColor;
    }
    return Center(
      child: SizedBox.fromSize(
        size: widget.size,
        child: AnimatedContainer(
          duration: widget.duration,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: activeColor),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: widget.duration,
                left: _postion(true),
                right: _postion(false),
                child: Builder(builder: (context) {
                  return AnimatedContainer(
                    duration: widget.duration,
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
                    final disabled = index == widget.currentIndex;
                    void onChange() => widget.onChanged?.call(index);

                    return Expanded(
                      child: widget.builder?.call(
                            context,
                            index,
                            disabled ? null : onChange,
                          ) ??
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: disabled ? null : onChange,
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
