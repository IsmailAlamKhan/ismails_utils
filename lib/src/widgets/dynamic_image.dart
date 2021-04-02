import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphx/graphx.dart';
import 'package:get/get.dart';
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
    this.isSvg,
  })  : assert(
          image is File || image is Uint8List || image is String,
          'DynamicImage - Only String, File and Uint8List is supported',
        ),
        super(key: key);
  final VoidCallback? onTap, onDoubleTap, onLongPress;
  final double? width;
  final double? height;
  final String? hero;

  final dynamic image;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final bool? isSvg;

  bool get _isNetwork =>
      !(image?.startsWith(BaseConsts.kasssetIMAGEPATH) ?? true) ||
      image.toString().startsWith('http') ||
      image.toString().startsWith('https');
  bool get _svg => isSvg ?? image.toString().contains('.svg');

  @override
  Widget build(BuildContext context) {
    if (hero != null) {
      return Hero(
        tag: hero!,
        child: GestureDetector(
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress,
          onTap: onTap,
          child: _build,
        ),
      );
    }
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTap: onTap,
      child: _build,
    );
  }

  Widget get _build {
    if (_svg) {
      return SvgPicture.asset(
        image,
        fit: fit,
        height: height,
        width: width,
      );
    } else if (image is File) {
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
      if (!_isNetwork) {
        return Image.asset(
          image!,
          fit: fit,
          height: height,
          width: width,
        );
      }
      return Builder(builder: (context) {
        return CachedNetworkImage(
          placeholder: (_, __) => Container(
            color: context.theme.primaryColor.withOpacity(.3),
          ),
          height: height,
          width: width,
          imageUrl: image!,
          fit: fit,
        );
      });
    } else {
      return Builder(builder: (context) {
        return FittedBox(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Unsupported format',
              style: context.textTheme.headline4,
            ),
          ),
        );
      });
    }
  }
}
