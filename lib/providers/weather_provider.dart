import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_mate/providers/connection_provider.dart';
import 'package:weather_mate/providers/favorite_provider.dart';
import 'package:weather_mate/providers/search_provider.dart';
import 'package:weather_mate/services/connection_service.dart';

import '../models/weather_model.dart';
import '../services/api_service.dart';
import '../services/location_service.dart';

final _apiService = ApiService();
final _locationService = LocationService();

final weatherProvider = FutureProvider((ref) async {
  final searchState = ref.read(searchProvider);
  final favoriteNotifier = ref.read(favoriteProvider.notifier);

  final connectionService = ConnectionService();

  WeatherData? weatherData;
  if (searchState.isSearching) {
    if (await connectionService.isConnected()) {
      weatherData = await _apiService.fetchWeatherData(
        searchState.lat,
        searchState.lon,
      );
    } else {
      ref.read(connectionProvider.notifier).state = false;
    }

    if (weatherData != null) {
      final place = await _locationService.getUserLocation(
        searchState.lat,
        searchState.lon,
      );
      debugPrint(place.toString()); //! printing place to console

      favoriteNotifier.addFavorite(
          searchState.lat, searchState.lon, weatherData, place);
    }
  } else {
    final position = await _locationService.getUserPosition();
    if (await connectionService.isConnected()) {
      weatherData = await _apiService.fetchWeatherData(
        position.latitude,
        position.longitude,
      );
    } else {
      ref.read(connectionProvider.notifier).state = false;
    }

    if (weatherData != null) {
      final place = await _locationService.getUserLocation(
        position.latitude,
        position.longitude,
      );
      favoriteNotifier.addFavorite(
          position.latitude, position.longitude, weatherData, place);
    }
  }

  return weatherData;
});
