import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';
import '../services/location_service.dart';

// !for services
final apiServiceProvider = Provider((ref) => ApiService());
final locationServiceProvider = Provider((ref) => LocationService());



