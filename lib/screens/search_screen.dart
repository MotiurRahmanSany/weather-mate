// ignore_for_file: unused_result

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/area_provider.dart';
import '../providers/location_provider.dart';
import '../providers/screen_provider.dart';
import '../providers/search_provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/search_suggestion_tile.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _inputController = TextEditingController();
  Timer? _debounce;
  // final _connectionService = ConnectionService();

  bool hasSearched = false;

  @override
  void dispose() {
    _debounce?.cancel();
    _inputController.dispose();
    super.dispose();
  }

  void _performSearch(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      setState(() {
        if (value.isEmpty) {
          hasSearched = false;
        } else {
          hasSearched = true;
        }
      });
      ref.refresh(areaProvider(value));
    });
  }

  @override
  Widget build(BuildContext context) {
    final areaState =
        hasSearched ? ref.watch(areaProvider(_inputController.text)) : null;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Search Location'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Search for a location you want to know the current weather of',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _inputController,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: const Icon(Icons.location_on_outlined),
                          suffixIcon: _inputController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    _inputController.clear();
                                    ref
                                        .read(searchProvider.notifier)
                                        .clearSearch();
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 20,
                                  ),
                                )
                              : null,
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: _performSearch,
                        onSubmitted: (value) {
                          final value = _inputController.text;
                          if (value.isNotEmpty) {
                            setState(() {
                              hasSearched = true;
                            });
                            ref.refresh(areaProvider(value));
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        final value = _inputController.text;
                        if (value.isNotEmpty) {
                          setState(() {
                            hasSearched = true;
                          });
                          ref.refresh(areaProvider(value));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
                if (hasSearched)
                  areaState?.when(
                        data: (areas) {
                          if (areas == null || areas.isEmpty) {
                            return const Text(
                              'No location found',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          }
                          return Expanded(
                            child: ListView.builder(
                                itemCount: areas.length,
                                itemBuilder: (context, index) {
                                  final area = areas[index];
                                  return SearchSuggestionTile(
                                    title: area.name ?? 'Area Name',
                                    subtitle:
                                        '${area.state ?? ''}, ${area.country ?? ''}',
                                    onTap: () {
                                      ref
                                          .read(searchProvider.notifier)
                                          .performSearch(area.lat!, area.lon!);

                                      ref.refresh(locationProvider);

                                      ref
                                          .read(screenIndexProvider.notifier)
                                          .state = 0;
                                      ref.refresh(weatherProvider);
                                    },
                                  );
                                }),
                          );
                        },
                        loading: () => const LinearProgressIndicator(),
                        error: (error, _) => Text(
                          error.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ) ??
                      const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
