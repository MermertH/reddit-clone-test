import 'package:flutter/material.dart';

class ConstantColors {
  final Map<String, Color> defaultColors = {
    'searchBarColor': const Color.fromARGB(255, 240, 240, 240),
    'black': const Color.fromARGB(255, 0, 0, 0),
    'blue': const Color.fromARGB(255, 20, 132, 214),
    'primaryColor': const Color.fromARGB(255, 255, 84, 20),
  };

  MaterialColor kPrimarySwatch = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
}
