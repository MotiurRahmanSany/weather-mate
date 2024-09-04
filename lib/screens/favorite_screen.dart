// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_mate/providers/favorite_provider.dart';
import 'package:weather_mate/providers/screen_provider.dart';
import 'package:weather_mate/providers/search_provider.dart';
import 'package:weather_mate/providers/weather_provider.dart';
import 'package:weather_mate/widgets/favorite_tile.dart';

import '../providers/location_provider.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  final Widget noFavorites = const Center(
    child: Text('No favorite locations added yet!'),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteLocations = ref.watch(favoriteProvider);

    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.1),
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: favoriteLocations.isEmpty
            ? noFavorites
            : ListView.builder(
                itemCount: favoriteLocations.length,
                itemBuilder: (context, index) {
                  final location = favoriteLocations[index];

                  return Dismissible(
                    key: ValueKey(location),
                    onDismissed: (direction) {
                      ref
                          .read(favoriteProvider.notifier)
                          .removeFavorite(location);
                    },
                    background: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.withOpacity(.4),
                      ),
                      child: const Icon(Icons.delete),
                    ),
                    child: FavoriteTile(
                      location: location,
                      onTap: () {
                        ref
                            .read(searchProvider.notifier)
                            .performSearch(location.lat, location.lon);
                        ref.refresh(locationProvider);
                        ref.refresh(screenIndexProvider.notifier).state = 0;
                        ref.refresh(weatherProvider);
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
