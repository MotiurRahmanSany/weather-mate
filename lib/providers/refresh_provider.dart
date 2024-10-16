import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:weather_mate/core/constants/hive_constants.dart';

final _refreshTimeProvider = Provider<DateTime?>((ref) {
  final refreshTimeBox = Hive.box(HiveConstants.refreshTimeBoxName);

  return refreshTimeBox.get(HiveConstants.refreshTimeKey, defaultValue: null);
});

final canRefreshProvider = Provider<bool>((ref) {
  final lastRefreshTime = ref.watch(_refreshTimeProvider);

  if (lastRefreshTime == null) return true;

  final currentTime = DateTime.now();

  return currentTime.difference(lastRefreshTime).inMinutes >= 30;
});

