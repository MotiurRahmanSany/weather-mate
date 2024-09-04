import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_mate/utils/api_url.dart';

import '../models/area_model.dart';
import '../models/weather_model.dart';

class ApiService {
  static final _dio = Dio();

  Future<WeatherData?> fetchWeatherData(double lat, double lon) async {
    try {
      final response = await _dio.get(
        weatherApiUrl(lat, lon),
      );

      if (response.statusCode == 200) {
        final weatherData =
            WeatherData.fromJson(response.data as Map<String, dynamic>);

          
        return weatherData;
      } else {
        print('Failed to load data');
      }
    } on DioException catch (err) {
      print('Error Occured: $err');
    }
    return null;
  }

  Future<List<Area>?> fetchAreas(String area) async {
    try {
      final response = await _dio.get(areaApiUrl(area));
      if (response.statusCode == 200) {
        return (response.data as List)
            .map<Area>(
              (area) => Area.fromJson(area as Map<String, dynamic>),
            )
            .toList();
      }
    } on DioException catch (err) {
      debugPrint(err.message);
    }
    return null;
  }
}
