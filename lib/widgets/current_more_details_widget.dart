import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_mate/utils/get_formatted_datetime.dart';
import 'package:weather_mate/widgets/error_widget.dart';

import '../helper/format_temp.dart';
import '../models/weather_model.dart';
import '../providers/weather_provider.dart';

class CurrentMoreDetailsWidget extends ConsumerWidget {
  const CurrentMoreDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherProvider);

    return weatherState.when(
      data: (weather) {
        return _buildCurrentMoreDetailsWidget(context, weather, ref);
      },
      error: (err, st) {
        return ShowErrorToUser();
      },
      loading: () {
        return _buildCurrentMoreDetailsWidget(context, null, ref);
      },
    );
  }

  Widget _buildCurrentMoreDetailsWidget(
      BuildContext context, WeatherData? weather, WidgetRef ref) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: weather != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'More Information',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.35, // height: 245
                    child: GridView(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 16 / 14,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                      children: [
                        _buildDetailsItem(
                          context,
                          title: 'Feels Like',
                          value: formatTemperature(
                            ref,
                            weather.current!.feelsLike!.toInt(),
                          ),
                        ),
                        _buildDetailsItem(
                          context,
                          title: 'Wind Speed',
                          value: '${weather.current!.windSpeed} m/s',
                        ),
                        _buildDetailsItem(context,
                            title: 'Humidity',
                            value: '${weather.current!.humidity}%'),
                        _buildDetailsItem(context,
                            title: 'Pressure',
                            value: '${weather.current!.pressure} hPa'),
                        _buildDetailsItem(context,
                            title: 'Visibility',
                            value:
                                '${(weather.current!.visibility! / 1000).toStringAsFixed(2)} km'),
                        _buildDetailsItem(context,
                            title: 'UV Index',
                            value: weather.current!.uvi.toString()),
                        _buildDetailsItem(context,
                            title: 'Clouds',
                            value: '${weather.current!.clouds}%'),
                        _buildDetailsItem(
                          context,
                          title: 'Sunrise',
                          value: DateFormat('jm').format(
                            getFormattedDateTime(weather.current!.sunrise!),
                          ),
                        ),
                        _buildDetailsItem(
                          context,
                          title: 'Sunset',
                          value: DateFormat('jm').format(
                            getFormattedDateTime(weather.current!.sunset!),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : null);
  }

  Widget _buildDetailsItem(context,
      {required String title, required String value}) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.12),
        borderRadius: BorderRadius.circular(15),
      ),
      // height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
