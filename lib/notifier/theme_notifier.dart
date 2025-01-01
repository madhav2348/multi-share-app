import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  ThemeMode _thememode = ThemeMode.light;
  ThemeMode get themeMode => _thememode;

  void toggle(bool isDark) {
    _thememode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
