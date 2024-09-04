import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

   _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme') ?? 'light';
    state = theme == 'light' ? lightMode : darkMode;
  }

  void _saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }
}
