import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:filepicker_windows/filepicker_windows.dart';

import '../../src.dart';
import 'abstract.dart';

class IoFilePicker extends IsmailFilePicker {
  @override
  File pickFileWindows({
    Map<String, String>? filterSpecification,
    int defaultFilterIndex = 0,
    String? defaultExtension,
    required String title,
  }) {
    final filePicker = OpenFilePicker()
      ..filterSpecification = filterSpecification ?? {'All Files': '*.*'}
      ..defaultFilterIndex = defaultFilterIndex
      ..defaultExtension = defaultExtension
      ..title = title;
    final _file = filePicker.getFile();
    if (_file != null) {
      return _file;
    }
    throw IsmailException.error("No file selected");
  }

  @override
  Future<File> pickFile({
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    bool allowCompression = true,
    bool allowMultiple = false,
    bool withData = false,
    bool withReadStream = false,
  }) async {
    final result = await FilePicker.platform.pickFiles(
      type: type,
      allowedExtensions: allowedExtensions,
      onFileLoading: onFileLoading,
      allowCompression: allowCompression,
      allowMultiple: allowMultiple,
      withData: withData,
      withReadStream: withReadStream,
    );

    if (result != null && result.files.first.path != null) {
      return File(result.files.first.path!);
    }
    throw IsmailException.error("No file selected");
  }

  @override
  Future<Uint8List> pickFileWeb({
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    bool? allowCompression,
    bool allowMultiple = false,
    bool? withData,
    bool? withReadStream,
  }) =>
      throw UnimplementedError();
}

IoFilePicker getFilePicker() => IoFilePicker();
