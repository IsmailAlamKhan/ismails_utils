import 'dart:io';

import 'package:dio/dio.dart';

import '../../src.dart';
import 'stub.dart' if (dart.library.io) 'io.dart';

abstract class FileService {
  final logger = LoggerService('File Service');
  static FileService? _instance;

  static FileService get instance {
    return _instance ??= getFileService;
  }

  String readFile(File file);
  void writeFile(String val, File file, [FileMode mode = FileMode.append]);
  Future<File> makeFile(String name, [String? extraPath]);
  Future<Response> uploadFile(
    File file,
    String url, [
    String? name,
    String? dir,
  ]);
  Future<Directory> get getLocalPath;
}
