import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_mate/providers/theme_provider.dart';
import 'package:weather_mate/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
