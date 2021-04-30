import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../src.dart';
import 'logger.dart';

class FileService {
  FileService.init() {
    _init();
  }
  static late FileService instance;
  late Directory localPath;
  Future<Directory> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory;
  }

  static Future<Response> uploadFile(
    File file,
    String url, [
    String? name,
    String? dir,
  ]) async {
    final dio = DioClient.instance;
    final _name = name != null ? '$name${p.extension(file.path)}' : null;
    LoggerService.instance.logger.i(_name);

    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: _name ?? p.basename(file.path),
      )
    });
    return dio.post(url, data: formData);
  }

  File makeFile(String name, [String? extraPath]) {
    final _file = File('${localPath.path}$extraPath/$name');
    if (_file.existsSync()) {
      LoggerService.instance.logger.i('File exists');
      return _file;
    } else {
      _file.createSync(recursive: true);
      LoggerService.instance.logger.i('File created at ${_file.path}');
      return _file;
    }
  }

  void writeFile(String val, File file, [FileMode mode = FileMode.append]) {
    if (file.existsSync()) {
      file.writeAsStringSync(val, mode: mode);
    } else {
      throw CustomException.error('File was not found');
    }
  }

  String readFile(File file) {
    if (file.existsSync()) {
      return file.readAsStringSync();
    } else {
      throw CustomException.error('File was not found');
    }
  }

  Future<void> _init() async {
    localPath = await _localPath;
    instance = this;
    // ignore: no_runtimetype_tostring
    LoggerService.instance.logger.i('$runtimeType Started');
  }
}
