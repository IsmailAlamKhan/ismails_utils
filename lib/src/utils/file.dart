import 'dart:io';
import 'package:dio/dio.dart';

import '../src.dart';

class FileService {
  FileService.init() {
    _init();
  }
  static FileService get instance =>
      throw throwPlatformException('File system not supported on web');
  void writeFile(String val, File file, [FileMode mode = FileMode.append]) =>
      throw throwPlatformException('File system not supported on web');

  String readFile(File file) =>
      throw throwPlatformException('File system not supported on web');
  static Future<Response> uploadFile(
    File file,
    String url, [
    String? name,
    String? dir,
  ]) =>
      throw throwPlatformException('File system not supported on web');

  File makeFile(String name, [String? extraPath]) =>
      throw throwPlatformException('File system not supported on web');
  void _init() =>
      throw throwPlatformException('File system not supported on web');
}
