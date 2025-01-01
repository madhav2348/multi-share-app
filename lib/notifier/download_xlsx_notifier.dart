import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '/notifier/share_file_notifier.dart';

class DownloadFileAsXlsx extends ChangeNotifier{
  File? _downloadedFile;
  File? get downloadedFile => _downloadedFile;
  String _name = '';
  String get name => _name;

  Future<void> downloadfiler(List<int> fileAsInt) async {
    Directory dir;
    final perm = await Permission.accessMediaLocation.request();
    if (perm.isGranted) {
      if (Platform.isAndroid) {
        dir = Directory('/storage/emulated/0/Download');
      } else {
        dir = await getApplicationDocumentsDirectory();
      }
      _name = DateTime.now().toIso8601String();

      final file = File('${dir.path}/$_name.xlsx');

      final shareableFile = file
        ..createSync()
        ..writeAsBytesSync(fileAsInt);
      _downloadedFile = shareableFile;
      ShareFile().share(dir, name);
    } else {
      return;
    }
  }
}
