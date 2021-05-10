import 'package:flutter/material.dart';

/// {@template ismails_utils.widgets.KeepAlivePage}
/// wrap this widget [KeepAlivePage] around your Widget or use the keepAlive
/// extenision to keep the widget alive
/// {@endtemplate}
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
