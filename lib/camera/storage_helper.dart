import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;

class StorageHelper {
  static Future<String> _getFolderPath() async {
    final Directory dir = 
    Directory('/storage/emulated/0/DCIM/FlutterNativeCam');
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir.path;
  }

  static Future<File> saveImage(File file, String prefix) async {
    final String dirPath = await _getFolderPath();
    final String fileName =
        '$prefix${DateTime.now().millisecondsSinceEpoch}${path.extension(file.path)}';
    final String savedPath = path.join(dirPath, fileName);
    final savedFile = await file.copy(savedPath);

    // Tambahan: panggil media scanner agar gambar muncul di galeri
    const MethodChannel channel = MethodChannel('com.example.yourapp/scan');
    try {
      await channel.invokeMethod('scanFile', {'path': savedFile.path});
    } catch (e) {
      print("Media scan failed: $e");
    }

    return savedFile;

    
  }
}