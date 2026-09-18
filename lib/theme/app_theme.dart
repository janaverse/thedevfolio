import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF0B0B12);
  static const Color card = Color(0xFF12121B);
  static const Color pink = Color(0xFFFF78AE);
  static const Color lightPink = Color(0xFFFFA1C5);
  static const Color textPrimary = Color(0xFFF8F8F8);
  static const Color textSecondary = Color(0xFFB8B8C2);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    fontFamily: 'Arial',
    colorScheme: const ColorScheme.dark(
      primary: pink,
      secondary: lightPink,
      surface: card,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: textPrimary,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: textSecondary,
        fontSize: 14,
      ),
    ),
  );
}