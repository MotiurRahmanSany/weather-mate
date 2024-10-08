import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:weather_mate/screens/no_internet_screen.dart';
import 'package:weather_mate/widgets/custom_navigation.dart';

import '../providers/internet_provider.dart';
import '../providers/screen_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screens = ref.watch(screenProvider);
    final currentScreenIndex = ref.watch(screenIndexProvider);
    final internetState = ref.watch(internetProvider);
    return internetState.when(
        data: (state) {
          return state == InternetStatus.connected
              ? Scaffold(
                  body: SafeArea(child: screens[currentScreenIndex]),
                  bottomNavigationBar: const CustomNavigation(),
                )
              : const NoInternetScreen();
        },
        error: (err, st) {
          return const NoInternetScreen();
        },
        loading: () => const Text(''));

  }
}
