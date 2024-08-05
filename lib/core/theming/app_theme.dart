import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),
    shadowColor: Colors.white,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        )),
  );
  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
    ),
    shadowColor: Colors.black,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );
}
