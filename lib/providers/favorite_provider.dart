import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_mate/models/weather_model.dart';

import '../models/favorite_location.dart';
import '../services/api_service.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteLocationNotifier, List<FavoriteLocation>>(
        (ref) {
  return FavoriteLocationNotifier();
});

class FavoriteLocationNotifier extends StateNotifier<List<FavoriteLocation>> {
  FavoriteLocationNotifier() : super([]) {
    _loadFavoriteLocation();
  }
  static const String key = 'favoritelocations';

  void addFavorite(
      double lat, double lon, WeatherData weather, Placemark place) {
    final isAlreadyInDatabase =
        state.indexWhere((loc) => loc.lat == lat && loc.lon == lon);

    if (isAlreadyInDatabase != -1) {
      state[isAlreadyInDatabase] = state[isAlreadyInDatabase].copyWith(
        temp: weather.current!.temp!,
        icon: weather.current!.weather![0].icon,
        description: weather.current!.weather![0].description,
      );
    } else {
      final fav = FavoriteLocation(
        lat: lat,
        lon: lon,
        city: place.locality ?? '',
        country: place.country ?? '',
        temp: weather.current!.temp,
        description: weather.current!.weather![0].description,
        icon: weather.current!.weather![0].icon,
      );
      state = [...state, fav];
    }

    _saveFavoriteLocation();
  }

  void removeFavorite(FavoriteLocation fav) {
    state = state
        .where((loc) => (loc.lat != fav.lat && loc.lon != fav.lon))
        .toList();

    _saveFavoriteLocation();
  }

  Future<void> _loadFavoriteLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteLocations = prefs.getStringList(key) ?? [];
    state = favoriteLocations
        .map((fav) => FavoriteLocation.fromJson(json.decode(fav)))
        .toList();

    await _refreshFavoritesWeather();
  }

  void _saveFavoriteLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteLocations =
        state.map((fav) => json.encode(fav.toJson())).toList();

    prefs.setStringList(key, favoriteLocations);
  }

  static final _apiService = ApiService();

  Future<void> _refreshFavoritesWeather() async {
    final refreshWeather = await Future.wait(state.map((fav) async {
      // fetch weather data for each favorite location
      final weather = await _apiService.fetchWeatherData(fav.lat, fav.lon);

      if (weather != null) {
        return fav.copyWith(
          temp: weather.current!.temp,
          description: weather.current!.weather![0].description,
          icon: weather.current!.weather![0].icon,
        );
      }

      return fav;
    }));

    state = refreshWeather;
  }
}
