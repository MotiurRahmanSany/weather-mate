import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_mate/core/constants/hive_constants.dart';
import 'package:weather_mate/models/current_weather.dart';
import 'package:weather_mate/models/daily_weather.dart';
import 'package:weather_mate/models/favorite_location.dart';
import 'package:weather_mate/models/hourly_weather.dart';
import 'package:weather_mate/models/weather_model.dart';
import 'package:weather_mate/providers/theme_provider.dart';
import 'package:weather_mate/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //! Initializing Hive
  final appStorageDirPath = await getApplicationDocumentsDirectory();
  Hive.initFlutter();
  Hive.init(appStorageDirPath.path);

  //! registering the adapters
  Hive.registerAdapter(WeatherDataAdapter());
  Hive.registerAdapter(CurrentAdapter());
  Hive.registerAdapter(HourlyAdapter());
  Hive.registerAdapter(DailyAdapter());
  Hive.registerAdapter(WeatherAdapter());
  Hive.registerAdapter(TempAdapter());
  Hive.registerAdapter(FavoriteLocationAdapter());

  //! Opening Hive boxes
  await Hive.openBox<WeatherData>(HiveConstants.weatherDataBoxName);
  await Hive.openBox<FavoriteLocation>(HiveConstants.favoriteLocationsBoxName);
  await Hive.openBox<String>(HiveConstants.prefBoxName);
  await Hive.openBox<bool>(HiveConstants.hasDataFetchedOnceBoxName);


  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Weather Mate',
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
