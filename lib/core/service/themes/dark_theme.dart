// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DarkTheme {
  ThemeData customDarkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black.withOpacity(0.72),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Colors.white70,
        height: 2,
        fontSize: 14,
      ),
      headlineLarge: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w500,
        fontFamily: 'SourceSansPro',
        fontSize: 30.0,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        color: Colors.white70,
        fontFamily: 'SourceSansPro',
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Rubik',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: Colors.grey,
        fontFamily: 'SourceSansPro',
      ),
      labelLarge: TextStyle(
          fontFamily: 'SourceSansPro',
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w600),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      elevation: 0,
      backgroundColor: Colors.black.withOpacity(0.92),
      titleTextStyle: const TextStyle(
          color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600),
    ),
  );
}
