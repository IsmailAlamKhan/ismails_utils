part of screenshot;

class ScreenshotController with IsmailLoggerMixin {
  late final _globalKey = GlobalKey();
  Future<T> _capture<T>(
    RenderRepaintBoundary boundary, {
    required double pixelRatio,
  }) async {
    final image = await boundary.toImage(pixelRatio: pixelRatio);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final _bytes = byteData!.buffer;
    if (<T>[] is List<ByteData>) {
      return byteData as T;
    }
    if (<T>[] is List<Uint8List>) {
      return _bytes.asUint8List() as T;
    }
    if (<T>[] is List<File>) {
      final dir = Directory.systemTemp.createTempSync();
      final file = File('${dir.path}/${getRandomString(10)}.png');
      logInfo(file.path);
      file.createSync(recursive: true);
      file.writeAsBytesSync(_bytes.asUint8List());
      logInfo(
        '****************'
        ' Make sure to delete this file if you upload it somewhere otherwise this will be kept on the storage '
        '****************',
      );
      return file as T;
    }
    throw UnsupportedError(
      "${T.runtimeType} can't be returned from this function",
    );
  }

  /// Get the image in Uint8List/ ByteData/ File format
  Future<T> capture<T>([double? pixelRatio]) {
    final context = _globalKey.currentContext;
    if (context == null) {
      throw FlutterError(
        'this controller is not assinged to a ScreenshotWidget',
      );
    }
    final boundary = context.findRenderObject()! as RenderRepaintBoundary;
    return _capture<T>(
      boundary,
      pixelRatio: pixelRatio ?? window.devicePixelRatio,
    );
  }

  Future<T> captureFromWidget<T>({
    double? pixelRatio,
    required Widget child,
  }) {
    final _pixelRatio = pixelRatio ?? window.devicePixelRatio;
    final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();

    final logicalSize = window.physicalSize / window.devicePixelRatio;
    final imageSize = window.physicalSize;

    assert(logicalSize.aspectRatio == imageSize.aspectRatio);

    final renderView = RenderView(
      window: window,
      child: RenderPositionedBox(
        child: repaintBoundary,
      ),
      configuration: ViewConfiguration(
        size: logicalSize,
        devicePixelRatio: _pixelRatio,
      ),
    );

    final pipelineOwner = PipelineOwner();
    final buildOwner = BuildOwner(focusManager: FocusManager());

    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();

    final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: child,
      ),
    ).attachToRenderTree(buildOwner);

    buildOwner.buildScope(rootElement);

    buildOwner.buildScope(rootElement);
    buildOwner.finalizeTree();

    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();

    return _capture<T>(repaintBoundary, pixelRatio: _pixelRatio);
  }
}
