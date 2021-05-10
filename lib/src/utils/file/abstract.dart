import 'dart:io';

import 'package:dio/dio.dart';

import '../../src.dart';
import 'stub.dart' if (dart.library.io) 'io.dart';

/// a SimpleFileService which gives abbility to read/ write/ make and upload file
abstract class FileService {
  ///logger for the [FileService]
  final logger = LoggerService('File Service');
  static FileService? _instance;

  /// get the instance of [FileService]
  static FileService get instance {
    return _instance ??= getFileService;
  }

  /// Read the give file
  String readFile(File file);

  /// write a file with the give value and the file
  void writeFile(String val, File file, [FileMode mode = FileMode.append]);

  /// make a file on the [getApplicationDocumentsDirectory]
  Future<File> makeFile(String name, [String? extraPath]);

  /// upload file to your server with dio
  Future<Response> uploadFile(
    File file,
    String url, [
    String? name,
    String? dir,
  ]);

  /// [getApplicationDocumentsDirectory]
  Future<Directory> get getLocalPath;
}
