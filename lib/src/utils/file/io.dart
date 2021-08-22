import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../../src.dart';

FileManager get getFileService => FileServiceForIo();

class FileServiceForIo extends FileManager {
  @override
  Future<Directory> get getLocalPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory;
  }

  @override
  Future<Response> uploadFile(
    File file,
    String url, [
    String? name,
    String? dir,
  ]) async {
    final dio = DioClient.instance;
    final _name = name != null ? '$name${p.extension(file.path)}' : null;
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: _name ?? p.basename(file.path),
      )
    });
    return dio.post(url, data: formData);
  }

  @override
  Future<File> makeFile(String name, [String? extraPath]) async {
    var slash = '/';
    if (Platform.isWindows) {
      slash = '\\';
    }
    final localPath = await getLocalPath;
    final _file = File('${localPath.path}${extraPath ?? ''}$slash$name');
    if (_file.existsSync()) {
      logger.info('File exists');
      return _file;
    } else {
      _file.createSync(recursive: true);
      logger.info('File created at ${_file.path}');
      return _file;
    }
  }

  @override
  void writeFile(String val, File file, [FileMode mode = FileMode.append]) {
    if (file.existsSync()) {
      file.writeAsStringSync(val, mode: mode);
    } else {
      throw IsmailException.error('File was not found');
    }
  }

  @override
  String readFile(File file) {
    if (file.existsSync()) {
      return file.readAsStringSync();
    } else {
      throw IsmailException.error('File was not found');
    }
  }
}
