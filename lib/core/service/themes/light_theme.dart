// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:quran_app/core/util/color.dart';

class LightTheme {
  ThemeData customLightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: AppColors.kbackGroundColor,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      titleMedium: TextStyle(
        color: Colors.black87,
        height: 2,
        fontSize: 14,
      ),
      labelLarge: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),
      headlineLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 30.0,
      ),
      bodyLarge: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(
        fontSize: 14,
        color: Colors.grey,
      ),
    ),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: AppColors.kbackGroundColor,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600),
    ),
  );
}
