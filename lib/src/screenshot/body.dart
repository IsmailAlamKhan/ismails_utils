part of screenshot;

class ScreenshotWidget extends StatelessWidget {
  const ScreenshotWidget({
    Key? key,
    required this.screenshotController,
    required this.child,
  }) : super(key: key);
  final ScreenshotController screenshotController;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: screenshotController._globalKey,
      child: child,
    );
  }
}
