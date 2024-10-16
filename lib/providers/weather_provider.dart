import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:weather_mate/providers/favorite_provider.dart';
import 'package:weather_mate/providers/internet_provider.dart';
import 'package:weather_mate/providers/search_provider.dart';
import 'package:weather_mate/providers/services_provider.dart';

import '../core/constants/hive_constants.dart';
import '../models/weather_model.dart';

final weatherProvider = FutureProvider<WeatherData?>((ref) async {
  final searchState = ref.read(searchProvider);
  final favoriteNotifier = ref.read(favoriteProvider.notifier);

  final internetState = ref.read(internetStatusProvider);

  //! Hive Boxes
  final weatherDataBox = Hive.box<WeatherData>(HiveConstants.weatherDataBoxName);
  final hasDataFetchedOnceBox = Hive.box<bool>(HiveConstants.hasDataFetchedOnceBoxName);

  WeatherData? weatherData;

  if (searchState.isSearching) {
    //! for searched location
    if (await internetState.isConnected()) {
      weatherData = await ref.read(apiServiceProvider).fetchWeatherData(
            searchState.lat,
            searchState.lon,
          );

      if (weatherData != null) {
        final place = await ref.read(locationServiceProvider).getUserLocation(
              searchState.lat,
              searchState.lon,
            );

        favoriteNotifier.addFavorite(searchState.lat, searchState.lon, weatherData, place);
      }
    }
  } else {
    if (await internetState.isConnected()) {
      //! for current location with internet
      final position = await ref.read(locationServiceProvider).getUserPosition();
      weatherData = await ref.read(apiServiceProvider).fetchWeatherData(
            position.latitude,
            position.longitude,
          );

      if (weatherData != null) {
        weatherDataBox.put(HiveConstants.weatherDataKey, weatherData);
        hasDataFetchedOnceBox.put(HiveConstants.hasDataFetchedOnceKey, true);
      }
    } else {
      //! Offline handling for current location
      weatherData = weatherDataBox.get(HiveConstants.weatherDataKey, defaultValue: null);
    }
  }

  return weatherData;
});
