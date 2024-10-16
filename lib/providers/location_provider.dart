import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_mate/providers/search_provider.dart';
import 'package:weather_mate/providers/services_provider.dart';


final locationProvider = FutureProvider((ref) async {
  final searchState = ref.read(searchProvider);

  if (searchState.isSearching) {
    return await ref.read(locationServiceProvider).getUserLocation(
      searchState.lat,
      searchState.lon,
    );
  } else {
    final position = await ref.read(locationServiceProvider).getUserPosition();

    return await ref.read(locationServiceProvider).getUserLocation(
      position.latitude,
      position.longitude,
    );
  }
});
