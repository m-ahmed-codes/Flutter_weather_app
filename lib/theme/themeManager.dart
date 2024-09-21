import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  get themeMode => _themeMode;

  toggleTheme(bool isLight) {
    _themeMode = isLight ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  // @override
  // void notifyListeners() {
  //   super.notifyListeners();
  // }
}
