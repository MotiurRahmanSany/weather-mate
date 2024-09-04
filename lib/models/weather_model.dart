import '../models/current_weather.dart';
import '../models/daily_weather.dart';
import '../models/hourly_weather.dart';

class WeatherData {
  // double? lat;
  // double? lon;
  // String? timezone;
  // int? timezoneOffset;
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;

  WeatherData(
      {
      // this.lat,
      // this.lon,
      // this.timezone,
      // this.timezoneOffset,
      this.current,
      this.hourly,
      this.daily});

  WeatherData.fromJson(Map<String, dynamic> json) {
    // lat = json['lat'];
    // lon = json['lon'];
    // timezone = json['timezone'];
    // timezoneOffset = json['timezone_offset'];
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
    // data['lat'] = lat;
    // data['lon'] = lon;
    // data['timezone'] = timezone;
    // data['timezone_offset'] = timezoneOffset;
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


