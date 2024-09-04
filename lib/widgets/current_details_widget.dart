import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../widgets/error_widget.dart';
import '../models/weather_model.dart';
import '../providers/weather_provider.dart';

class CurrentDetailsWidget extends ConsumerWidget {
  const CurrentDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);
    return weather.when(
      data: (weather) {
        return _buildCurrentDetailsWidget(context, weather, false);
      },
      error: (err, st) {
        return ShowErrorToUser();
      },
      loading: () {
        return _buildCurrentDetailsWidget(context, null, true);
      },
    );
  }

  Widget _buildCurrentDetailsWidget(
      BuildContext context, WeatherData? weather, bool isLoading) {
    return Skeletonizer(
      enabled: isLoading,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCurrentDetailsItem(
              context,
              value: weather != null
                  ? '${weather.current!.windSpeed} %'
                  : 'Loading...',
              imagePath: 'assets/icons/windspeed.png',
            ),
            _buildCurrentDetailsItem(
              context,
              value: weather != null
                  ? '${weather.current!.clouds} %'
                  : 'Loading...',
              imagePath: 'assets/icons/clouds.png',
            ),
            _buildCurrentDetailsItem(
              context,
              value: weather != null
                  ? '${weather.current!.humidity} %'
                  : 'Loading...',
              imagePath: 'assets/icons/humidity.png',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentDetailsItem(context,
      {required String value, required String imagePath}) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.12),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(imagePath),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
