import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      primary: Colors.white,
      secondary: Colors.black,
      inversePrimary: Colors.black,
    ),
);

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Color(0xFF222222),
      primary: Color(0xFF333333),
      secondary: Colors.white,
      inversePrimary: Colors.white,
    ),
);
