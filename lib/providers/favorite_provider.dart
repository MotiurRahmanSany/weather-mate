import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hive/hive.dart';
import 'package:weather_mate/core/constants/hive_constants.dart';
import 'package:weather_mate/models/weather_model.dart';

import '../models/favorite_location.dart';



final favoriteProvider =
    StateNotifierProvider<FavoriteLocationNotifier, List<FavoriteLocation>>(
        (ref) {
  return FavoriteLocationNotifier();
});

class FavoriteLocationNotifier extends StateNotifier<List<FavoriteLocation>> {
  FavoriteLocationNotifier() : super([]) {
    _loadFavoriteLocationsFromDB();
  }

  void addFavorite(
      double lat, double lon, WeatherData weather, Placemark place) {
    final isAlreadyInDatabase =
        state.indexWhere((loc) => loc.lat == lat && loc.lon == lon);

    if (isAlreadyInDatabase != -1) {
      final updatedFav = state[isAlreadyInDatabase].copyWith(
        temp: weather.current!.temp!,
        icon: weather.current!.weather![0].icon,
        description: weather.current!.weather![0].description,
      );
      state[isAlreadyInDatabase] = updatedFav;
      _saveFavoriteLocationInDB(updatedFav);
      
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
      state = [fav, ...state];
    _saveFavoriteLocationInDB(fav);
    }

  }

  void removeFavorite(FavoriteLocation fav) {
    state = state
        .where((loc) => (loc.lat != fav.lat && loc.lon != fav.lon))
        .toList();

    _removeFavoriteLocationFromDB(fav.id);
  }

  void clearFavorites() {
    state = [];
    _clearFavoriteLocationsFromDB();
  }

  // ! Hive Operations for favorite locations

  final favoriteLocationBox =
      Hive.box<FavoriteLocation>(HiveConstants.favoriteLocationsBoxName);

  void _loadFavoriteLocationsFromDB() {
    state = favoriteLocationBox.values.toList().cast<FavoriteLocation>();
  }

  void _saveFavoriteLocationInDB(FavoriteLocation fav) {
    favoriteLocationBox.put(fav.id, fav);
  }

  void _removeFavoriteLocationFromDB(String favId) {
    favoriteLocationBox.delete(favId);
  }

  void _clearFavoriteLocationsFromDB() {
    favoriteLocationBox.clear();
  }
}
