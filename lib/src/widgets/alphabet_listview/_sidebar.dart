import 'package:flutter/material.dart';
import '../../src.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
    required this.controller,
    required this.sideBarTheme,
    required this.sideBarItemBuilder,
  }) : super(key: key);

  final AlphabetController<AlphabetListViewModel> controller;

  final AlphabetListviewTheme? sideBarTheme;

  final AlphabetListViewSideBarBuilder? sideBarItemBuilder;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(cardTheme: sideBarTheme?.cardTheme),
      child: Card(
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (var i = 0; i < controller.alphabets.length; i++)
                  GestureDetector(
                    onTap: () => controller.scrollTo(i),
                    child: controller
                        .builder<AlphabetController<AlphabetListViewModel>>(
                      (_, controller, ___) {
                        final Color sideBarActiveColor =
                            sideBarTheme?.sideBarActiveItemColor ??
                                Theme.of(context).primaryColor;
                        final isActive = i == controller.currentIndex;
                        return DefaultTextStyle(
                          style: sideBarTheme?.textStyle ??
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: isActive ? sideBarActiveColor : null,
                                  ),
                          child: sideBarItemBuilder?.call(
                                context,
                                isActive,
                                controller.alphabets[i],
                              ) ??
                              Text(
                                controller.alphabets[i],
                              ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
