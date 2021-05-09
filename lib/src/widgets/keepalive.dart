import 'package:flutter/material.dart';

class KeepAlivePage extends StatefulWidget {
  const KeepAlivePage(
    this.child, {
    Key? key,
  }) : super(key: key);
  final Widget child;
  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
