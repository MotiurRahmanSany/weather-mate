import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_mate/helper/format_temp.dart';
import 'package:weather_mate/widgets/error_widget.dart';

import '../models/weather_model.dart';
import '../providers/weather_provider.dart';
import '../utils/get_formatted_time.dart';

class HourlyWidget extends ConsumerWidget {
  const HourlyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);
    return weather.when(
      data: (weather) {
        return _buildHourlyWidget(context, weather, false, ref);
      },
      error: (err, st) {
        return const ShowErrorToUser();
      },
      loading: () {
        return _buildHourlyWidget(context, null, true, ref);
      },
    );
  }

  Widget _buildHourlyWidget(BuildContext context, WeatherData? weather,
      bool isLoading, WidgetRef ref) {
    return Skeletonizer(
      enabled: isLoading,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.1),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        margin: const EdgeInsets.only(top: 0, bottom: 10, left: 10, right: 10),
        child: Column(
          children: [
            Text(
              weather != null
                  ? 'Hourly weather forecast'
                  : 'Hourly Data loading...',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 15),
            weather != null
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.17,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weather.hourly!.length > 40
                          ? 40
                          : weather.hourly!.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context)
                              .colorScheme
                              .onSurfaceVariant
                              .withOpacity(.12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('jm').format(
                                getFormattedDateTime(
                                    weather.hourly![index].dt!),
                              ),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                            ),
                            Image.asset(
                                'assets/weather/${weather.hourly![index].weather![0].icon}.png',
                                width: 40),
                            Text(
                              formatTemperature(
                                ref,
                                weather.hourly![index].temp!,
                              ),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.17,
                    child: const Center(
                      child: Text('Loading...'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
