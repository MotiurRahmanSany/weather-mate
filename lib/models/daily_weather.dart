import '../models/current_weather.dart';

class Daily {
  int? dt;
  Temp? temp;
  List<Weather>? weather;
  // int? sunrise;
  // int? sunset;
  // int? moonrise;
  // int? moonset;
  // double? moonPhase;
  // String? summary;
  // FeelsLike? feelsLike;
  // int? pressure;
  // int? humidity;
  // double? dewPoint;
  // double? windSpeed;
  // int? windDeg;
  // double? windGust;
  // int? clouds;
  // double? pop;
  // double? uvi;
  // double? rain;

  Daily({
    this.dt,
    this.temp,
    this.weather,
    // this.sunrise,
    // this.sunset,
    // this.moonrise,
    // this.moonset,
    // this.moonPhase,
    // this.summary,
    // this.feelsLike,
    // this.pressure,
    // this.humidity,
    // this.dewPoint,
    // this.windSpeed,
    // this.windDeg,
    // this.windGust,
    // this.clouds,
    // this.pop,
    // this.uvi,
    // this.rain
  });

  Daily.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    weather = (json['weather'] as List<dynamic>?)
        ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList();
    // sunrise = json['sunrise'];
    // sunset = json['sunset'];
    // moonrise = json['moonrise'];
    // moonset = json['moonset'];
    // moonPhase = json['moon_phase'];
    // summary = json['summary'];
    // feelsLike = json['feels_like'] != null
    // ? FeelsLike.fromJson(json['feels_like'])
    // : null;
    // pressure = json['pressure'];
    // humidity = json['humidity'];
    // dewPoint = json['dew_point'];
    // windSpeed = json['wind_speed'];
    // windDeg = json['wind_deg'];
    // windGust = json['wind_gust'];
    // clouds = json['clouds'];
    // pop = json['pop'];
    // uvi = json['uvi'];
    // rain = json['rain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    // data['sunrise'] = sunrise;
    // data['sunset'] = sunset;
    // data['moonrise'] = moonrise;
    // data['moonset'] = moonset;
    // data['moon_phase'] = moonPhase;
    // data['summary'] = summary;
    data['temp'] = temp?.toJson();
    // if (feelsLike != null) {
    //   data['feels_like'] = feelsLike!.toJson();
    // }
    // data['pressure'] = pressure;
    // data['humidity'] = humidity;
    // data['dew_point'] = dewPoint;
    // data['wind_speed'] = windSpeed;
    // data['wind_deg'] = windDeg;
    // data['wind_gust'] = windGust;
    data['weather'] = weather?.map((e) => e.toJson()).toList();

    // data['clouds'] = clouds;
    // data['pop'] = pop;
    // data['uvi'] = uvi;
    // data['rain'] = rain;
    return data;
  }
}

class Temp {
  int? min;
  int? max;
  // double? day;
  // double? night;
  // double? eve;
  // double? morn;

  Temp({
    this.min,
    this.max,
    // this.day,
    // this.night,
    // this.eve,
    // this.morn,
  });

  Temp.fromJson(Map<String, dynamic> json) {
    min = (json['min'] as num?)?.round();
    max = (json['max'] as num?)?.round();
    // day = (json['day'] as num?)?.toDouble();
    // night = (json['night'] as num?)?.toDouble();
    // eve = (json['eve'] as num?)?.toDouble();
    // morn = (json['morn'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min'] = min;
    data['max'] = max;
    // data['day'] = day;
    // data['night'] = night;
    // data['eve'] = eve;
    // data['morn'] = morn;
    return data;
  }
}

// class FeelsLike {
//   double? day;
//   double? night;
//   double? eve;
//   double? morn;

//   FeelsLike({this.day, this.night, this.eve, this.morn});

//   FeelsLike.fromJson(Map<String, dynamic> json) {
//     day = json['day'];
//     night = json['night'];
//     eve = json['eve'];
//     morn = json['morn'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['day'] = day;
//     data['night'] = night;
//     data['eve'] = eve;
//     data['morn'] = morn;
//     return data;
//   }
// }

