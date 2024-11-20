import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hive/hive.dart';
import 'package:weather_mate/core/constants/hive_constants.dart';
import 'package:weather_mate/models/weather_model.dart';
import 'package:weather_mate/utils/get_location_name.dart';
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
    final index = state.indexWhere((loc) => loc.lat == lat && loc.lon == lon);

    if (index != -1) {
      // Updating existing location
      final updatedFav = state[index].copyWith(
        temp: weather.current!.temp!,
        icon: weather.current!.weather![0].icon,
        description: weather.current!.weather![0].description,
      );
      state = [updatedFav, ...state.where((ele) => ele != state[index])];
    } else {
      // Add new location
      final fav = FavoriteLocation(
        lat: lat,
        lon: lon,
        city: getLocationName(place),
        country: place.country ?? 'Unknown Country',
        temp: weather.current!.temp!,
        description: weather.current!.weather![0].description,
        icon: weather.current!.weather![0].icon,
      );
      state = [fav, ...state];
      _saveFavoriteLocationInDB(state);
    }
  }

  void removeFavorite(FavoriteLocation fav) {
    state = state.where((ele) => ele != fav).toList();
    _saveFavoriteLocationInDB(state);
  }

  void clearFavorites() {
    state = [];
    _clearFavoriteLocationsFromDB();
  }

  //! Hive-related operations
  final favoriteLocationBox =
      Hive.box<List<FavoriteLocation>>(HiveConstants.favoriteLocationsBoxName);

  void _loadFavoriteLocationsFromDB() {
    final favorites = favoriteLocationBox.values.cast<List<FavoriteLocation>>();
    final favs = favorites.toList().expand((element) => element).toList();
    if (favs.isEmpty) {
      state = [];
    } else {
      state = favs;
    }
    print('Loaded $favs');
  }

  void _saveFavoriteLocationInDB(List<FavoriteLocation> favs) {
    favoriteLocationBox.put(HiveConstants.favoriteLocationsKey, favs);
    print('Saved $favs');
  }

  void _clearFavoriteLocationsFromDB() {
    favoriteLocationBox.clear();
  }
}
