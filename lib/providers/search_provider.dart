import 'package:flutter_riverpod/flutter_riverpod.dart';

class Search {
  final bool isSearching;
  final double lat;
  final double lon;

  Search({
    this.isSearching = false,
    this.lat = 0.0,
    this.lon = 0.0,
  });

}


final searchProvider = StateNotifierProvider<SearchProvider, Search>((ref) {
  return SearchProvider();
});

class SearchProvider extends StateNotifier<Search> {
  SearchProvider() : super(Search());

  void performSearch(double lat, double lon) {
    state = Search(isSearching: true, lat: lat, lon: lon);
  }

  void clearSearch() {
    state = Search();
  }
}