import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graphx/graphx.dart';

import '../src.dart';

class DynamicImage extends StatelessWidget {
  const DynamicImage({
    Key? key,
    this.image,
    this.width,
    this.height,
    this.onTap,
    this.onDoubleTap,
    this.hero,
    this.fit = BoxFit.cover,
    this.onLongPress,
    this.borderRadius,
  })  : assert(
          image is File || image is Uint8List || image is String,
          'DynamicImage - Only String, File and Uint8List is supported',
        ),
        super(key: key);

  bool get isNetwork =>
      !(image?.startsWith(BaseConsts.kasssetIMAGEPATH) ?? true);
  final VoidCallback? onTap, onDoubleTap, onLongPress;
  final double? width;
  final double? height;
  final String? hero;

  final dynamic image;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    if (hero != null) {
      return Hero(
        tag: hero!,
        child: GestureDetector(
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress,
          onTap: onTap,
          child: _build(context),
        ),
      );
    }
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTap: onTap,
      child: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    if (image is File) {
      return Image.file(
        image!,
        fit: fit,
        height: height,
        width: width,
      );
    } else if (image is Uint8List) {
      return Image.memory(
        image!,
        fit: fit,
        height: height,
        width: width,
      );
    } else if (image is String) {
      if (!isNetwork) {
        return Image.asset(
          image!,
          fit: fit,
          height: height,
          width: width,
        );
      }
      return CachedNetworkImage(
        placeholder: (_, __) => Container(
          color: context.theme.primaryColor.withOpacity(.3),
        ),
        height: height,
        width: width,
        imageUrl: image!,
        fit: fit,
      );
    } else {
      return FittedBox(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Unsupported format',
            style: context.textTheme.headline6?.copyWith(
              color: Colors.red,
            ),
          ),
        ),
      );
    }
  }
}
