import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:weather_mate/core/constants/hive_constants.dart';

enum TemperatureUnit { celsius, fahrenheit }

final temperatureUnitProvider =
    StateNotifierProvider<TemperatureUnitNotifier, TemperatureUnit>(
        (ref) => TemperatureUnitNotifier());

class TemperatureUnitNotifier extends StateNotifier<TemperatureUnit> {
  TemperatureUnitNotifier() : super(TemperatureUnit.celsius) {
    _loadTemperatureUnit();
  }

  void setUnit(TemperatureUnit unit) {
    state = unit;
    _saveTemperatureUnit(unit == TemperatureUnit.celsius ? 'C' : 'F');
  }

  final prefBox = Hive.box<String>(HiveConstants.prefBoxName);

  void _loadTemperatureUnit() {
    final tempUnit = prefBox.get(HiveConstants.unitKey, defaultValue: 'C');
    state =
        tempUnit == 'C' ? TemperatureUnit.celsius : TemperatureUnit.fahrenheit;
  }

  void _saveTemperatureUnit(String unit) {
    prefBox.put(HiveConstants.unitKey, unit);
  }
}
