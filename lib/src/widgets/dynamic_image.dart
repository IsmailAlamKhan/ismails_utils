import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graphx/graphx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../src.dart';

/// An Image widget which is dynamic returns the image according to the source
/// you give. Also adds hero to the widget is [hero] property isn't null.
/// As a bonus the widget animates when the source changes
class DynamicImage<T> extends StatelessWidget {
  const DynamicImage({
    Key? key,
    required this.image,
    this.width,
    this.height,
    this.onTap,
    this.onDoubleTap,
    this.hero,
    this.fit = BoxFit.cover,
    this.onLongPress,
    this.borderRadius,
    this.isSvg,
  })  : assert(
          image is File || image is Uint8List || image is String,
          'DynamicImage - Only String, File and Uint8List is supported',
        ),
        super(key: key);

  /// onTap, onDoubleTap, onLongPress which provieds gesuture callback
  /// on the images
  final VoidCallback? onTap, onDoubleTap, onLongPress;
  final double? width;
  final double? height;

  /// hero tag for the image it automatically adds a Hero widget this isn't null
  final String? hero;

  /// the sourse of the image
  final T image;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final bool? isSvg;

  bool get _isNetwork =>
      !image.toString().startsWith(IsmailsConstants.kasssetIMAGEPATH) ||
      image.toString().startsWith('http') ||
      image.toString().startsWith('https');
  bool get _svg => isSvg ?? image.toString().contains('.svg');

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      layoutBuilder: (currentChild, previousChildren) => currentChild!,
      child: _build,
    );
  }

  Widget get _build {
    if (hero != null) {
      return Hero(
        tag: hero!,
        child: GestureDetector(
          key: ValueKey(image),
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress,
          onTap: onTap,
          child: _image,
        ),
      );
    }
    return GestureDetector(
      key: ValueKey(image),
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTap: onTap,
      child: _image,
    );
  }

  Widget get _image {
    if (_svg) {
      if (image is String) {
        return SvgPicture.asset(
          image.toString(),
          fit: fit,
          height: height,
          width: width,
        );
      } else if (image is File) {
        return SvgPicture.file(
          image as File,
          fit: fit,
          height: height,
          width: width,
        );
      } else {
        return SvgPicture.memory(
          image as Uint8List,
          fit: fit,
          height: height,
          width: width,
        );
      }
    } else if (image is File) {
      return Image.file(
        image as File,
        fit: fit,
        height: height,
        width: width,
      );
    } else if (image is Uint8List) {
      return Image.memory(
        image as Uint8List,
        fit: fit,
        height: height,
        width: width,
      );
    } else if (image is String) {
      if (!_isNetwork) {
        return Image.asset(
          image.toString(),
          fit: fit,
          height: height,
          width: width,
        );
      }
      return CachedNetworkImage(
        placeholder: (context, __) => Container(
          color: Theme.of(context).primaryColor,
        ),
        height: height,
        width: width,
        imageUrl: image.toString(),
        fit: fit,
      );
    } else {
      return FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(builder: (context) {
            return Text(
              'Unsupported format',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.red),
            );
          }),
        ),
      );
    }
  }
}
