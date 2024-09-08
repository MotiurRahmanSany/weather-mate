import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_mate/helper/format_temp.dart';
import 'package:weather_mate/widgets/current_details_widget.dart';
import 'package:weather_mate/widgets/error_widget.dart';

import '../models/weather_model.dart';
import '../providers/weather_provider.dart';

class CurrentWidget extends ConsumerWidget {
  const CurrentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);
    return weather.when(
      data: (weather) {
        return _buildCurrentWidget(context, weather, false, ref);
      },
      error: (err, st) {
        return const ShowErrorToUser();
      },
      loading: () {
        return _buildCurrentWidget(context, null, true, ref);
      },
    );
  }

  _buildCurrentWidget(BuildContext context, WeatherData? weather,
      bool isLoading, WidgetRef ref) {
    return Skeletonizer(
      enabled: isLoading,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.1),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        margin: const EdgeInsets.only(top: 0, bottom: 10, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                weather != null
                    ? Image.asset(
                        'assets/weather/${weather.current!.weather![0].icon}.png',
                        height: 80,
                        width: 80,
                      )
                    : const CircleAvatar(
                      radius: 40,
                    ),
                // const SizedBox(
                //   width: 10,
                // ),
                const Spacer(),
                Text.rich(
                  TextSpan(
                    text: weather != null
                        ? formatTemperature(ref, weather.current!.temp!)
                        : 'Loading...',
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: weather != null
                            ? '${weather.current!.weather![0].description}'
                            : '...',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const CurrentDetailsWidget(),
          ],
        ),
      ),
    );
  }
}
