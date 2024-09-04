import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum TemperatureUnit { celsius, fahrenheit }

final temperatureUnitProvider =
    StateNotifierProvider<TemperatureUnitNotifier, TemperatureUnit>(
        (ref) => TemperatureUnitNotifier());

const String unitKey = 'tempUnit';

class TemperatureUnitNotifier extends StateNotifier<TemperatureUnit> {
  TemperatureUnitNotifier() : super(TemperatureUnit.celsius) {
    _loadTemperatureUnit();
  }

  void setUnit(TemperatureUnit unit) {
    state = unit;
    _saveTemperatureUnit(unit == TemperatureUnit.celsius ? 'C' : 'F');
  }

  void _loadTemperatureUnit() async {
    final prefs = await SharedPreferences.getInstance();
    final tempUnit = prefs.getString(unitKey) ?? 'C';
    state =
        tempUnit == 'C' ? TemperatureUnit.celsius : TemperatureUnit.fahrenheit;
  }

  void _saveTemperatureUnit(String unit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(unitKey, unit);
  }
}
