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

  static final ThemeData lightTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      background: Colors.white,
      primary: Colors.black,
      secondary: Color.fromRGBO(248, 247, 248, 1),
      tertiary: Colors.blueGrey.shade400,
      // primaryContainer: Colors.grey.shade00,
    ),
    // Define other theme properties like typography, etc. if needed.
  );
}
