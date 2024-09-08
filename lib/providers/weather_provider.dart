import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_mate/providers/favorite_provider.dart';
import 'package:weather_mate/providers/search_provider.dart';

import '../models/weather_model.dart';
import '../services/api_service.dart';
import '../services/location_service.dart';

final _apiService = ApiService();
final _locationService = LocationService();

final weatherProvider = FutureProvider((ref) async {
  final searchState = ref.read(searchProvider);
  final favoriteNotifier = ref.read(favoriteProvider.notifier);


  WeatherData? weatherData;
  if (searchState.isSearching) {
      weatherData = await _apiService.fetchWeatherData(
        searchState.lat,
        searchState.lon,
      );

    if (weatherData != null) {
      final place = await _locationService.getUserLocation(
        searchState.lat,
        searchState.lon,
      );

      favoriteNotifier.addFavorite(
          searchState.lat, searchState.lon, weatherData, place);
    }
  } else {
    final position = await _locationService.getUserPosition();
      weatherData = await _apiService.fetchWeatherData(
        position.latitude,
        position.longitude,
      );

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
