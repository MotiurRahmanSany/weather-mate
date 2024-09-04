import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_mate/helper/format_temp.dart';

import '../widgets/error_widget.dart';
import '../models/weather_model.dart';
import '../providers/weather_provider.dart';

class SliderWidget extends ConsumerWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);
    return weather.when(
      data: (weather) {
        return _buildSliderWidget(context, weather, ref);
      },
      error: (err, st) {
        return const ShowErrorToUser();
      },
      loading: () {
        return _buildSliderWidget(context, null, ref);
      },
    );
  }

  Widget _buildSliderWidget(
      BuildContext context, WeatherData? weather, WidgetRef ref) {
    return weather != null
        ? Container(
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .onSurfaceVariant
                  .withOpacity(.12),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Comfort Level',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 20),
                SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weather.current!.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    spinnerMode: false,
                    size: 160,
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor: Theme.of(context).colorScheme.inversePrimary,
                      progressBarColors: [
                        Theme.of(context).colorScheme.primary.withOpacity(.9),
                        Theme.of(context).colorScheme.primary.withOpacity(.6),
                      ],
                    ),
                    customWidths: CustomSliderWidths(
                      handlerSize: 0,
                      trackWidth: 15,
                      progressBarWidth: 15,
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: 'Humidity',
                      mainLabelStyle: const TextStyle(
                        letterSpacing: 1,
                        fontSize: 34,
                        height: 2,
                      ),
                      bottomLabelStyle: const TextStyle(
                        letterSpacing: .1,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text.rich(
                      style: const TextStyle(
                        letterSpacing: 1,
                        height: 2,
                      ),
                      TextSpan(text: 'Feels Like: ', children: [
                        TextSpan(
                          text: formatTemperature(
                            ref,
                            weather.current!.feelsLike!.toInt(),
                            showUnit: false,
                          ),
                        ),
                      ]),
                    ),
                    Text.rich(
                      style: const TextStyle(
                        letterSpacing: 1,
                        height: 2,
                      ),
                      TextSpan(
                        text: 'UV Index: ',
                        children: [
                          TextSpan(
                            text: '${weather.current!.uvi}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ))
        : SizedBox(
            height: MediaQuery.sizeOf(context).height * .3,
          );
  }
}
