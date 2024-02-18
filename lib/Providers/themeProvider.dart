import 'package:dtpl_app/Themes/colorPalate.dart';
import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _currentTheme = CustomThemes.lightTheme;

  ThemeData get currentTheme => _currentTheme;
  static bool isDark = true;

  void updateTheme() {
    isDark
        ? _currentTheme = CustomThemes.lightTheme
        : _currentTheme = CustomThemes.DarkTheme;
    isDark = !isDark;
    notifyListeners();
  }

  // void SetLightTheme() {
  //   isDark = false;
  //   notifyListeners();
  // }?
}
