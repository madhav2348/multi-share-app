// import 'package:share_data/notifier/share_notifier.dart';
// import 'dart:convert';
// import 'package:share_data/widget/Local/toastmessage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Storage {
  // Future<void> localSetRefData(RefrenceModel localmodel) async {
  //   try {
  //     final SharedPreferences pref = await SharedPreferences.getInstance();
  //     await pref.setString('key', localmodel.keyField);
  //     await pref.setString('paired', localmodel.pairedField);
  //   } catch (e) {
  //     showToast(message: 'Something went wrong during saving ');
  //   }
  // }

  // Future<void> setSingleData(SingleModel model) async {
  // Future<void> setSingleData(String model) async {
  //   try {
  //     final SharedPreferences pref = await SharedPreferences.getInstance();
  //     await pref.setString('key', model);
  //   } catch (e) {
  //     showToast(message: 'Something went wrong during saving ');
  //   }
  // }

  // Future<void> checkData() async {
  //   try {
  //     final SharedPreferences pref = await SharedPreferences.getInstance();
  //     final data = pref.getString('key') ?? '';
  //     Map<String, dynamic> decodeData = jsonDecode(data);
  //     ShareMapOfData().addToMap(decodeData);
  //   } catch (e) {
  //     showToast(message: 'Something went wrong during fetching data');
  //   }
  // }

  // Future<void> logout() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   await pref.clear();
  // }
// }
