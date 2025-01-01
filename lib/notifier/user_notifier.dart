import 'package:flutter/foundation.dart';
import 'package:share_data/widget/Local/toastmessage.dart';
import '/model/data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthData extends ChangeNotifier {
 
  RefrenceModel? _localData;
  bool _isLogged = false;

  RefrenceModel? get local => _localData;

  bool get islogged => _isLogged;

  Future<void> localSetAuth(RefrenceModel localmodel) async {
    if (_localData != null) {
      _isLogged = true;
      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('key', _localData!.keyField);
      await pref.setString('paired', _localData!.pairedField);
  
      await pref.setBool('login', _isLogged);
      _localData = localmodel;
    }else {
      showToast(message: 'User Already Exist');
    }
    notifyListeners();
  }

  Future<void> checkLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    _localData = RefrenceModel(
      keyField: pref.getString('key') ?? '',
      pairedField: pref.getString('paired') ?? ''
     
    );
    _isLogged = pref.getBool('login') ?? false;

    notifyListeners();
  }

  Future<void> logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    _localData = null;
    _isLogged = false;
  }
}
