import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_mate/providers/temp_unit_provider.dart';

String formatTemperature(WidgetRef ref, int temp,{bool showUnit = true}){
  final unit = ref.watch(temperatureUnitProvider);

  if (unit == TemperatureUnit.fahrenheit) {
    return showUnit ? '${((temp * 9 / 5) + 32).toInt()}°F' : '${((temp * 9 / 5) + 32).toInt()}°';
  }

  return showUnit ? '$temp°C' : '$temp°';
}
