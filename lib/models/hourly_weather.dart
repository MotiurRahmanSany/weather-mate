import 'package:hive/hive.dart';

import '../models/current_weather.dart';


part 'hourly_weather.g.dart';

@HiveType(typeId: 1)
class Hourly extends HiveObject {
  @HiveField(0)
  int? dt;
  @HiveField(1)
  int? temp;
  @HiveField(2)
  List<Weather>? weather;

  Hourly({
    this.dt,
    this.temp,
    this.weather,
  });

  Hourly.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] as int?;
    temp = (json['temp'] as num?)?.round();

    weather = (json['weather'] as List<dynamic>?)
        ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['temp'] = temp;

    data['weather'] = weather?.map((e) => e.toJson()).toList();

    return data;
  }
}
