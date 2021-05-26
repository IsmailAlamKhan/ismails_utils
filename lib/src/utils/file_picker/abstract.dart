import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

import 'stub.dart'
    if (dart.library.io) 'io.dart'
    if (dart.library.js) 'web.dart';

/// [IsmailFilePicker] a crossPlatform filepicker
abstract class IsmailFilePicker {
  static IsmailFilePicker? _instance;

  /// Get the instance of [IsmailFilePicker] depending on the platform
  static IsmailFilePicker get instance {
    _instance ??= getFilePicker();
    return _instance!;
  }

  /// File picker for windows which uses https://pub.dev/packages/filepicker_windows
  File pickFileWindows({
    Map<String, String>? filterSpecification,
    int defaultFilterIndex = 0,
    String? defaultExtension,
    required String title,
  });

  /// File picker for ios/Android which uses https://pub.dev/packages/file_picker
  Future<File> pickFile({
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    bool allowCompression = true,
    bool allowMultiple = false,
    bool withData = false,
    bool withReadStream = false,
  });

  /// File picker for web which uses https://pub.dev/packages/file_picker
  /// the only difference between this one and the [IsmailFilePicker.pickFile]
  /// is this one returns [Uint8List] because doesn't have support for file system
  Future<Uint8List> pickFileWeb({
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    bool allowCompression = true,
    bool allowMultiple = false,
    bool withData = false,
    bool withReadStream = false,
  });
}
