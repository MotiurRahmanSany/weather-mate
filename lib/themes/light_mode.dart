import 'package:flutter/material.dart';

final lightMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
    brightness: Brightness.light,
  ),
);
