import 'package:hive/hive.dart';

import '../models/current_weather.dart';
import '../models/daily_weather.dart';
import '../models/hourly_weather.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 0)
class WeatherData extends HiveObject {
  @HiveField(0)
  Current? current;
  @HiveField(1)
  List<Hourly>? hourly;
  @HiveField(2)
  List<Daily>? daily;

  WeatherData({
    this.current,
    this.hourly,
    this.daily,
  });

  WeatherData.fromJson(Map<String, dynamic> json) {
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    if (json['hourly'] != null) {
      hourly = <Hourly>[];
      json['hourly'].forEach((v) {
        hourly!.add(Hourly.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily!.add(Daily.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (hourly != null) {
      data['hourly'] = hourly!.map((v) => v.toJson()).toList();
    }
    if (daily != null) {
      data['daily'] = daily!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
