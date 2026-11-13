
import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF090D18);
  static const Color surface = Color(0xFF141B2B);
  static const Color primary = Color(0xFF1CE783);
  static const Color secondary = Color(0xFFD1D5DB);
  static const Color muted = Color(0xFF929DB4);
  static const Color border = Color(0xFF293248);

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    primaryColor: primary,

    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: secondary,
      surface: surface,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      foregroundColor: secondary,
      elevation: 0,
    ),
  );
}
