// ignore_for_file: unused_result, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_mate/providers/weather_provider.dart';

import '../providers/internet_provider.dart';
import '../utils/loader.dart';
import '../widgets/current_more_details_widget.dart';
import '../widgets/current_widget.dart';
import '../widgets/daily_widget.dart';
import '../widgets/hourly_widget.dart';
import '../widgets/location_widget.dart';
import '../widgets/slider_widget.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weahterDataState = ref.watch(weatherProvider);
    final hasData = ref.watch(hasDataProvider);
    final internetState = ref.read(internetStatusProvider);

    weahterDataState.when(
      data: (weatherData) async {
        if (await internetState.isConnected() == false && hasData) {
          //! Showing previously loaded data message if weatherData exists
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(
                    'You are offline, showing previously loaded data'),
                backgroundColor: Theme.of(context).colorScheme.error,
                duration: const Duration(seconds: 5),
              ),
            );
          });
        }
      },
      loading: () {
        return const Loader();
      },
      error: (error, stackTrace) {
        //! Handling error
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error loading weather data'),
            ),
          );
        });
      },
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            const SizedBox(height: 5),
            const LocationWidget(),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ref.refresh(weatherProvider);
              },
              child: const Icon(Icons.refresh),
            ),
            const CurrentWidget(),
            const SizedBox(height: 10),
            const HourlyWidget(),
            const SizedBox(height: 10),
            const DailyWidget(),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              height: 1,
            ),
            const CurrentMoreDetailsWidget(),
            const SizedBox(height: 8),
            const SliderWidget(),
          ],
        ),
      ),
    );
  }
}
