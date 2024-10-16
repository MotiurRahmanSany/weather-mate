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

  void _showBuyMeACoffeeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Support the Developer'),
          content: const Text(
            'If you like this app and want to support its development, you can buy me a coffee! '
            'Click the button below to make a small donation and keep the project alive. Thank you!',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // _launchURL('https://www.buymeacoffee.com/yourname'); // Replace with your actual link
              },
              icon: const Icon(Icons.coffee_outlined),
              label: const Text('Buy me a coffee'),
            ),
          ],
        );
      },
    );
  }

  

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
            PrefTiles(
              title: 'Buy me a coffee',
              subtitle: 'Support developer',
              icon: Icons.coffee_outlined,
              onTap: () => _showBuyMeACoffeeDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}
