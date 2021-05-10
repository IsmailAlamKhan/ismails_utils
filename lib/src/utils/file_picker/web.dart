import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import '../../src.dart';

import 'abstract.dart';

class WebFilePicker extends IsmailFilePicker {
  @override
  Future<Uint8List> pickFileWeb({
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    bool? allowCompression,
    bool allowMultiple = false,
    bool? withData,
    bool? withReadStream,
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

    if (result != null && result.files.first.bytes != null) {
      return result.files.first.bytes!;
    }
    throw IsmailException.error("No file selected");
  }

  @override
  Future<File> pickFile({
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    bool? allowCompression,
    bool allowMultiple = false,
    bool? withData,
    bool? withReadStream,
  }) =>
      throw UnimplementedError();

  @override
  File pickFileWindows({
    Map<String, String>? filterSpecification,
    int defaultFilterIndex = 0,
    String? defaultExtension,
    required String title,
  }) =>
      throw UnimplementedError();
}

WebFilePicker getFilePicker() => WebFilePicker();
