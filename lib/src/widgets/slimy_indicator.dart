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
    this.size = const Size(180, 30),
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
  final double currentIndex;
  final ValueChanged<double>? onChanged;
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
  double get currentIndex => widget.currentIndex;
  double _postion(bool isLeft) {
    return widget.buttonWidth * currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = widget.activeColor ?? Theme.of(context).primaryColor;
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
              Positioned(
                left: _postion(true),
                // right: _postion(false),
                child: Builder(builder: (context) {
                  return AnimatedContainer(
                    duration: widget.duration,
                    width: widget.buttonWidth,
                    height: widget.size.height,
                    color: activeColor,
                  );
                }),
              ),
              Row(
                children: widget.items.map(
                  (e) {
                    final index = widget.items.indexOf(e);
                    void onChange() {
                      widget.onChanged?.call(index.roundToDouble());
                    }

                    GestureTapCallback? onTap() {
                      if (index != widget.currentIndex) return onChange;
                    }

                    return Expanded(
                      child: widget.builder?.call(
                            context,
                            index,
                            onTap(),
                          ) ??
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: onTap(),
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
