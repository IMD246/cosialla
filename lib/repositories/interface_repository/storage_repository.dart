import 'dart:io';

import 'package:file_picker/file_picker.dart';

abstract class StorageRepository {
  Future<void> uploadMultipleFile({
    required List<PlatformFile> listFile,
    required String path,
  });

  Future<bool> uploadFile({
    required File file,
    required String filePath,
    required String fileName,
  });

  Future<String?> getFile({
    required String filePath,
    required String fileName,
  });
}
