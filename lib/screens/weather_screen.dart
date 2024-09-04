import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_mate/widgets/current_more_details_widget.dart';

import '../widgets/current_widget.dart';
import '../widgets/daily_widget.dart';
import '../widgets/hourly_widget.dart';
import '../widgets/location_widget.dart';
import '../widgets/slider_widget.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 5),
            // Location Widget
            const LocationWidget(),
            const SizedBox(height: 10),
            // CurrentWidget(),
            const CurrentWidget(),
            const SizedBox(height: 10),
            // Hourly Widget
            const HourlyWidget(),
            const SizedBox(height: 10),
            // DailyWidget(),
            const DailyWidget(),
            const SizedBox(height: 8),
            //  Custom Divider Line
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              height: 1,
            ),
            // More Details Grid View
            const CurrentMoreDetailsWidget(),
            const SizedBox(height: 8),
            // Slider for humidity
            const SliderWidget(),
          ],
        ),
      ),
    );
  }
}
