//! for internet connection

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../core/constants/hive_constants.dart';
import '../services/connection_service.dart';

final hasDataProvider = Provider<bool>((ref) {
  final hasDataBox = Hive.box<bool>(HiveConstants.hasDataFetchedOnceBoxName);

  return hasDataBox.get(
    HiveConstants.hasDataFetchedOnceKey,
    defaultValue: false,
  )!;
});

final internetStatusChangeProvider = StreamProvider<InternetStatus>((ref) {
  return InternetConnection().onStatusChange;
});

final internetStatusProvider = Provider((ref) {
  return ConnectionService();
});
