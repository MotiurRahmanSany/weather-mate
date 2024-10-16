import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:weather_mate/core/constants/hive_constants.dart';

import '../themes/dark_mode.dart';
import '../themes/light_mode.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(lightMode) {
    _loadTheme();
  }

  void toggleTheme() {
    state = (state.brightness == Brightness.dark) ? lightMode : darkMode;
  }

  void setTheme(ThemeData theme) {
    state = theme;
    _saveTheme(theme == lightMode ? 'light' : 'dark');
  }

  final prefBox = Hive.box<String>(HiveConstants.prefBoxName);

  _loadTheme() {
    final theme = prefBox.get(HiveConstants.themeKey, defaultValue: 'light');
    state = theme == 'light' ? lightMode : darkMode;
  }

  void _saveTheme(String theme) {
    prefBox.put(HiveConstants.themeKey, theme);
  }
}
