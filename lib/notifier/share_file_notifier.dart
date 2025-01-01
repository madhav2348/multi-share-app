
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';

class ShareFile extends ChangeNotifier {
  ShareResult? _shareXlsx;
  ShareResult? get shareXlsxFile => _shareXlsx;
  Future<void> share(Directory file, String name) async {
    _shareXlsx = await Share.shareXFiles([XFile('${file.path}/$name.xlsx')]);
    notifyListeners();
  }
}
