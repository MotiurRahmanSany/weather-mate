import '../models/current_weather.dart';

class Hourly {
  int? dt;
  int? temp;
  List<Weather>? weather;
  // double? feelsLike;
  // int? pressure;
  // int? humidity;
  // double? dewPoint;
  // double? uvi;
  // int? clouds;
  // int? visibility;
  // double? windSpeed;
  // int? windDeg;
  // double? windGust;
  // double? pop;
  // Rain? rain;

  Hourly({
    this.dt,
    this.temp,
    this.weather,
    // this.feelsLike,
    // this.pressure,
    // this.humidity,
    // this.dewPoint,
    // this.uvi,
    // this.clouds,
    // this.visibility,
    // this.windSpeed,
    // this.windDeg,
    // this.windGust,
    // this.pop,
    // this.rain,
  });

  Hourly.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] as int?;
    temp = (json['temp'] as num?)?.round();
    // feelsLike = json['feels_like'];
    // pressure = json['pressure'];
    // humidity = json['humidity'];
    // dewPoint = json['dew_point'];
    // uvi = json['uvi'];
    // clouds = json['clouds'];
    // visibility = json['visibility'];
    // windSpeed = json['wind_speed'];
    // windDeg = json['wind_deg'];
    // windGust = json['wind_gust'];
    weather = (json['weather'] as List<dynamic>?)
        ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList();
    // pop = json['pop'];
    // rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['temp'] = temp;
    // data['feels_like'] = feelsLike;
    // data['pressure'] = pressure;
    // data['humidity'] = humidity;
    // data['dew_point'] = dewPoint;
    // data['uvi'] = uvi;
    // data['clouds'] = clouds;
    // data['visibility'] = visibility;
    // data['wind_speed'] = windSpeed;
    // data['wind_deg'] = windDeg;
    // data['wind_gust'] = windGust;
    data['weather'] = weather?.map((e) => e.toJson()).toList();
    // data['pop'] = pop;
    // if (rain != null) {
    //   data['rain'] = rain!.toJson();
    // }
    return data;
  }
}

// class Rain {
//   double? d1h;

//   Rain({this.d1h});

//   Rain.fromJson(Map<String, dynamic> json) {
//     d1h = json['1h'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['1h'] = d1h;
//     return data;
//   }
// }