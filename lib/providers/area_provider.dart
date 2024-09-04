import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/area_model.dart';
import '../services/api_service.dart';

final _apiService = ApiService();

final areaProvider =
    FutureProvider.autoDispose.family<List<Area>?, String>((ref, area) async {
  return await _apiService.fetchAreas(area);
});
