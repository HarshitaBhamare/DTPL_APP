import 'package:flutter/material.dart';

class CustomThemes {
  static final ThemeData lightTheme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 243, 249, 251),
    onBackground: Color.fromARGB(255, 198, 219, 237),
    primary: Color.fromARGB(255, 22, 50, 114),
    primaryContainer: Color.fromARGB(255, 30, 86, 160),
    secondary: Color.fromARGB(255, 135, 192, 205),
    secondaryContainer: Color.fromARGB(255, 214, 228, 240),
    // secondaryContainer: Color.fromARGB(255, 135, 192, 205),
    tertiary: Colors.blueGrey.shade500,
    tertiaryContainer: Color.fromRGBO(10, 37, 73, 1),
  ));
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
    tertiaryContainer: Color.fromRGBO(10, 37, 73, 1),
  ));
  // static final ThemeData lightTheme = ThemeData.dark().copyWith(
  //     colorScheme: ColorScheme.dark(
  //   background: Color.fromRGBO(234, 242, 252, 1),
  //   primary: Color.fromRGBO(19, 51, 92, 1),
  //   primaryContainer: Color.fromRGBO(4, 12, 23, 1),
  //   secondary: Color.fromRGBO(248, 247, 248, 1),
  //   secondaryContainer: Color.fromRGBO(110, 166, 238, 1),
  //   // secondaryContainer: Color.fromRGBO(147, 194, 255, 1),
  //   tertiary: Colors.blueGrey.shade600,
  //   tertiaryContainer: Color.fromRGBO(219, 230, 243, 1),
  // ));
  // static final ThemeData DarkTheme = ThemeData.dark().copyWith(
  //     colorScheme: ColorScheme.dark(
  //   background: Color.fromRGBO(16, 47, 36, 1),
  //   // primary: Color.fromRGBO(133, 177, 236, 1),
  //   primaryContainer: Color.fromRGBO(251, 250, 218, 1),
  //   primary: Color.fromRGBO(173, 188, 159, 1),
  //   // primaryContainer: Color.fromRGBO(110, 166, 238, 1),
  //   secondary: Color.fromRGBO(173, 188, 159, 1),
  //   secondaryContainer: Color.fromRGBO(67, 104, 80, 1),
  //   tertiary: Colors.blueGrey.shade500,
  //   tertiaryContainer: Color.fromRGBO(85, 127, 100, 1),
  // ));
  // static final ThemeData lightTheme = ThemeData.dark().copyWith(
  //     colorScheme: ColorScheme.dark(
  //   background: Color.fromRGBO(234, 242, 252, 1),
  //   primary: Color.fromRGBO(19, 51, 92, 1),
  //   primaryContainer: Color.fromRGBO(4, 12, 23, 1),
  //   secondary: Color.fromRGBO(248, 247, 248, 1),
  //   secondaryContainer: Color.fromRGBO(110, 166, 238, 1),
  //   // secondaryContainer: Color.fromRGBO(147, 194, 255, 1),
  //   tertiary: Colors.blueGrey.shade600,
  //   tertiaryContainer: Color.fromRGBO(219, 230, 243, 1),
  // ));
  // static final ThemeData DarkTheme = ThemeData.dark().copyWith(
  //     colorScheme: const ColorScheme.dark(
  //   background: Color(0xFFE7F1F9), // bg
  //   // primary: Color.fromRGBO(133, 177, 236, 1),
  //   primaryContainer: Color.fromRGBO(250, 255, 236, 1), // text
  //   primary: Color.fromRGBO(175, 255, 255, 1), // image text
  //   // primaryContainer: Color.fromRGBO(110, 166, 238, 1),
  //   secondary: Color.fromRGBO(15, 52, 96, 1),
  //   secondaryContainer: Color.fromRGBO(50, 50, 50, 1), // button bg
  //   tertiary: Color.fromRGBO(100, 255, 236, 1),
  //   tertiaryContainer: Color.fromRGBO(13, 115, 119, 1), // inner button
  // ));
  // static final ThemeData lightTheme = ThemeData.dark().copyWith(
  //     colorScheme: ColorScheme.dark(
  //   background: Color.fromRGBO(234, 242, 252, 1),
  //   primary: Color.fromRGBO(19, 51, 92, 1),
  //   primaryContainer: Color.fromRGBO(4, 12, 23, 1),
  //   secondary: Color.fromRGBO(248, 247, 248, 1),
  //   secondaryContainer: Color.fromRGBO(110, 166, 238, 1),
  //   // secondaryContainer: Color.fromRGBO(147, 194, 255, 1),
  //   tertiary: Colors.blueGrey.shade600,
  //   tertiaryContainer: Color.fromRGBO(219, 230, 243, 1),
  // ));
}
