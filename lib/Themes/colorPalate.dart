import 'package:flutter/material.dart';

class CustomThemes {
  static final ThemeData DarkTheme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark(
    background: Color.fromRGBO(9, 25, 46, 1),
    // primary: Color.fromRGBO(133, 177, 236, 1),
    primaryContainer: Color.fromRGBO(48, 128, 232, 1),
    primary: Color.fromRGBO(130, 178, 241, 1),
    // primaryContainer: Color.fromRGBO(110, 166, 238, 1),
    secondary: Color.fromRGBO(14, 38, 69, 1),
    secondaryContainer: Color.fromRGBO(14, 38, 69, 1),
    tertiary: Colors.blueGrey.shade500,
  ));
  static final ThemeData lightTheme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark(
    background: Color.fromRGBO(234, 242, 252, 1),
    primary: Color.fromRGBO(19, 51, 92, 1),
    primaryContainer: Color.fromRGBO(4, 12, 23, 1),
    secondary: Color.fromRGBO(248, 247, 248, 1),
    secondaryContainer: Color.fromRGBO(110, 166, 238, 1),
    // secondaryContainer: Color.fromRGBO(147, 194, 255, 1),
    tertiary: Colors.blueGrey.shade600,
  ));
}
