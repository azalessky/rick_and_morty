import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  ThemeData lightTheme() => _buildTheme(Brightness.light);
  ThemeData darkTheme() => _buildTheme(Brightness.dark);

  ThemeData _buildTheme(Brightness brightness) {
    final themeData = ThemeData(brightness: brightness);
    final textTheme = GoogleFonts.tekturTextTheme(themeData.textTheme);

    return themeData.copyWith(
      textTheme: textTheme,
    );
  }
}
