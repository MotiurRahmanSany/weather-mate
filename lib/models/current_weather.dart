
class Current {
  int? dt;
  int? sunrise;
  int? sunset;
  int? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  // double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  // int? windDeg;
  // double? windGust;
  List<Weather>? weather;

  Current({
      this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    // this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    // this.windDeg,
    // this.windGust,
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
    // dewPoint = json['dew_point'];
    uvi = (json['uvi'] as num?)?.toDouble();
    clouds = json['clouds'] as int?;
    visibility = json['visibility'];
    windSpeed = (json['wind_speed'] as num?)?.toDouble();
    // windDeg = json['wind_deg'];
    // windGust = json['wind_gust'];
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
    // data['dew_point'] = dewPoint;
    data['uvi'] = uvi;
    data['clouds'] = clouds;
    data['visibility'] = visibility;
    data['wind_speed'] = windSpeed;
    // data['wind_deg'] = windDeg;
    // data['wind_gust'] = windGust;
    data['weather'] = weather?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
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
