import 'package:flutter/material.dart';

final darkMode = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
    brightness: Brightness.dark,
  ),
);
