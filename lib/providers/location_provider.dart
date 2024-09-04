import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_mate/providers/search_provider.dart';
import 'package:weather_mate/services/location_service.dart';

final _locationService = LocationService();

final locationProvider = FutureProvider((ref) async {
  final searchState = ref.read(searchProvider);

  if (searchState.isSearching) {
    return await _locationService.getUserLocation(
      searchState.lat,
      searchState.lon,
    );
  } else {
    final position = await _locationService.getUserPosition();

    return await _locationService.getUserLocation(
      position.latitude,
      position.longitude,
    );
  }
});
