import 'package:hive/hive.dart';

import '../models/current_weather.dart';

part 'daily_weather.g.dart';

@HiveType(typeId: 2)
class Daily extends HiveObject {
  @HiveField(0)
  int? dt;
  @HiveField(1)
  Temp? temp;
  @HiveField(2)
  List<Weather>? weather;

  Daily({
    this.dt,
    this.temp,
    this.weather,
  });

  Daily.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    weather = (json['weather'] as List<dynamic>?)
        ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;

    data['temp'] = temp?.toJson();

    data['weather'] = weather?.map((e) => e.toJson()).toList();

    return data;
  }
}

@HiveType(typeId: 3)
class Temp extends HiveObject {
  @HiveField(0)
  int? min;
  @HiveField(1)
  int? max;

  Temp({
    this.min,
    this.max,
  });

  Temp.fromJson(Map<String, dynamic> json) {
    min = (json['min'] as num?)?.round();
    max = (json['max'] as num?)?.round();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min'] = min;
    data['max'] = max;

    return data;
  }
}
