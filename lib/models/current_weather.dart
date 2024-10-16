import 'package:hive/hive.dart';

part 'current_weather.g.dart';

@HiveType(typeId: 4)
class Current extends HiveObject {
  @HiveField(0)
  int? dt;
  @HiveField(1)
  int? sunrise;
  @HiveField(2)
  int? sunset;
  @HiveField(3)
  int? temp;
  @HiveField(4)
  double? feelsLike;
  @HiveField(5)
  int? pressure;
  @HiveField(6)
  int? humidity;
  @HiveField(7)
  double? uvi;
  @HiveField(8)
  int? clouds;
  @HiveField(9)
  int? visibility;
  @HiveField(10)
  double? windSpeed;
  @HiveField(11)
  List<Weather>? weather;

  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.weather,
  });

  Current.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = (json['temp'] as num?)?.round();
    feelsLike = (json['feels_like'] as num?)?.toDouble();
    pressure = json['pressure'];
    humidity = json['humidity'] as int?;

    uvi = (json['uvi'] as num?)?.toDouble();
    clouds = json['clouds'] as int?;
    visibility = json['visibility'];
    windSpeed = (json['wind_speed'] as num?)?.toDouble();

    weather = (json['weather'] as List<dynamic>?)
        ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['pressure'] = pressure;
    data['humidity'] = humidity;

    data['uvi'] = uvi;
    data['clouds'] = clouds;
    data['visibility'] = visibility;
    data['wind_speed'] = windSpeed;

    data['weather'] = weather?.map((e) => e.toJson()).toList();
    return data;
  }
}

@HiveType(typeId: 5)
class Weather {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? main;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    main = json['main'] as String?;
    description = json['description'] as String?;
    icon = json['icon'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}
