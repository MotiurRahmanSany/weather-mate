import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_mate/providers/temp_unit_provider.dart';
import 'package:weather_mate/screens/about_screen.dart';
import 'package:weather_mate/themes/dark_mode.dart';
import 'package:weather_mate/themes/light_mode.dart';

import '../providers/theme_provider.dart';
import '../widgets/pref_tiles.dart';

class PreferenceScreen extends ConsumerWidget {
  const PreferenceScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    final currentUnit = ref.watch(temperatureUnitProvider);

    final themeName = currentTheme.brightness == Brightness.dark
        ? 'Dark Theme'
        : 'Light Theme';
    final tempUnitName =
        ref.watch(temperatureUnitProvider) == TemperatureUnit.celsius
            ? 'Celsius'
            : 'Fahrenheit';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            PrefTiles(
              title: 'Themes',
              subtitle: themeName,
              icon: Icons.color_lens_outlined,
              trailing: DropdownButton<ThemeData>(
                value: currentTheme,
                items: [
                  DropdownMenuItem(
                    value: lightMode,
                    child: const Text('Light Theme'),
                  ),
                  DropdownMenuItem(
                    value: darkMode,
                    child: const Text('Dark Theme'),
                  ),
                ],
                onChanged: (newTheme) {
                  if (newTheme != null) {
                    themeNotifier.setTheme(newTheme);
                  }
                },
              ),
            ),
            PrefTiles(
              title: 'Temperature',
              icon: Icons.thermostat,
              subtitle: tempUnitName,
              trailing: DropdownButton<TemperatureUnit>(
                value: currentUnit,
                items: const [
                  DropdownMenuItem(
                    value: TemperatureUnit.celsius,
                    child: Text('Celcius'),
                  ),
                  DropdownMenuItem(
                    value: TemperatureUnit.fahrenheit,
                    child: Text('Fahrenheit'),
                  ),
                ],
                onChanged: (newUnit) {
                  if (newUnit != null) {
                    ref.read(temperatureUnitProvider.notifier).setUnit(newUnit);
                  }
                },
              ),
            ),
            PrefTiles(
              title: 'About',
              subtitle: 'Know more about weather mate',
              icon: Icons.info_outline_rounded,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
