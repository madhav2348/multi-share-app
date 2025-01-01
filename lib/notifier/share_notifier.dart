import 'package:flutter/foundation.dart';

class ShareMapOfData extends ChangeNotifier {
  List<Map<String, dynamic>> _theDataList = [];
  List<Map<String, dynamic>> get theDataList => _theDataList;

  void addToMap(Map<String, dynamic> addData) {
    _theDataList.add(addData);
    notifyListeners();
  }
}
