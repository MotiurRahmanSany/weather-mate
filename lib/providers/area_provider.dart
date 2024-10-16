import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_mate/providers/services_provider.dart';

import '../models/area_model.dart';

final areaProvider =
    FutureProvider.autoDispose.family<List<Area>?, String>((ref, area) async {
  return await ref.watch(apiServiceProvider).fetchAreas(area);
});
