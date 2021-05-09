import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

import 'stub.dart'
    if (dart.library.io) 'io.dart'
    if (dart.library.js) 'web.dart';

abstract class IsmailFilePicker {
  static IsmailFilePicker? _instance;
  static IsmailFilePicker get instance {
    _instance ??= getFilePicker();
    return _instance!;
  }

  File pickFileWindows({
    Map<String, String>? filterSpecification,
    int defaultFilterIndex = 0,
    String? defaultExtension,
    required String title,
  });
  Future<File> pickFile({
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    bool? allowCompression,
    bool allowMultiple = false,
    bool? withData,
    bool? withReadStream,
  });
  Future<Uint8List> pickFileWeb({
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    bool? allowCompression,
    bool allowMultiple = false,
    bool? withData,
    bool? withReadStream,
  });
}
