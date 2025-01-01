import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

  void showToast( {required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}
