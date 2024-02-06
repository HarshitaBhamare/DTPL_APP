import 'package:flutter/material.dart';

class CustomThemes {
  // static final ThemeData darkTheme = ThemeData.dark().copyWith(
  //   colorScheme: const ColorScheme.dark(
  //     background: Color.fromRGBO(16, 16, 16, 1),
  //     primary: Colors.black,
  //     secondary: Colors.white,
  //     tertiary: Color.fromRGBO(63, 63, 63, 1),
  //   ),
  //   // Define other theme properties like typography, etc. if needed.
  // );
// primary: Colors.black,
// secondary: Color.fromRGBO(248, 247, 248, 1),
  static final ThemeData lightTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      // background: Color.fromRGBO(179, 205, 224, 1), //LIGHT
      secondary: Color.fromRGBO(194, 229, 247, 1),
      // secondary: Color.fromRGBO(146, 210, 249, 1), //light
      // background: Color.fromRGBO(0, 77, 116, 1),
      // primary: Color.fromRGBO(57, 88, 135, 1),//LIGHT
      primary: Color.fromRGBO(1, 31, 75, 1),
      background: Color.fromRGBO(168, 218, 249, 1), //LIGHT
      // secondary: Color.fromRGBO(179, 205, 224, 1),
      tertiary: Colors.blueGrey.shade600,
    ),
    // Define other theme properties like typography, etc. if needed.
  );
}
