import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class UtilsDownloadFile {
  static Future<String?> downloadFile(String url, String fileName) async {
    if (url.isEmpty) {
      return null;
    }
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    final response = await http.get(Uri.parse(url));
    File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  static Future<String?> getFileLocal(String path, String fileName) async {
    if (path.isEmpty || fileName.isEmpty) {
      return null;
    }
    final directory = await getApplicationDocumentsDirectory();
    final imgFile = File('${directory.path}/$path/$fileName.jpg');
    if (await imgFile.exists()) {
      log(imgFile.path);
    }
    return imgFile.path;
  }
}
