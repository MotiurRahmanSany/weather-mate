import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_mate/screens/favorite_screen.dart';
import 'package:weather_mate/screens/preference_screen.dart';
import 'package:weather_mate/screens/search_screen.dart';
import 'package:weather_mate/screens/weather_screen.dart';

final screenIndexProvider = StateProvider((ref) => 0);

final screenProvider = Provider((ref) => [
      const WeatherScreen(),
      const SearchScreen(),
      const FavoriteScreen(),
      const PreferenceScreen(),
  ]);
