import 'dart:convert';

import 'package:flutter/foundation.dart';
import '/model/data_model.dart';

class AddAndConvertData extends ChangeNotifier {
  String _getJson = '';
  String get getJson => _getJson;
  List<Map<String, dynamic>> _data = [];
  List<Map<String, dynamic>> get data => _data;

  void addData(RefrenceModel jsonData) {
    _data.add(jsonData.dataToJson());
    _getJson = jsonEncode(data);
    notifyListeners();
  }
}
