import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:share_data/model/single_model.dart';
import '/model/data_model.dart';

class AddAndConvertData extends ChangeNotifier {
  String _getJson = '';
  String get getJson => _getJson;
  List<Map<String, dynamic>> _data = [];
  List<Map<String, dynamic>> get data => _data;

  void addDataToRefModel(RefrenceModel jsonData) {
    _data.add(jsonData.dataToJson());
    _getJson = jsonEncode(jsonData.dataToJson());
    notifyListeners();
  }

  void addDataToSingleModel(SingleModel jsonData) {
    _data.add(jsonData.toJson());
    _getJson = jsonEncode(jsonData.toJson());
    notifyListeners();
  }
}
