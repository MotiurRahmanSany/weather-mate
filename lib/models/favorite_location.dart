// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FavoriteLocation {
  final String city;
  final double lat;
  final double lon;
  final String country;
  final int? temp;
  final String? description;
  final String? icon;
  bool isCurrent;

  FavoriteLocation({
    required this.city,
    required this.lat,
    required this.lon,
    required this.country,
    this.temp,
    this.description,
    this.icon,
    this.isCurrent = false,
  });


  FavoriteLocation copyWith({
    String? city,
    double? lat,
    double? lon,
    String? country,
    int? temp,
    String? description,
    String? icon,
    bool? isCurrent,
  }) {
    return FavoriteLocation(
      city: city ?? this.city,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      country: country ?? this.country,
      temp: temp ?? this.temp,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      isCurrent: isCurrent ?? this.isCurrent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'lat': lat,
      'lon': lon,
      'country': country,
      'temp': temp,
      'description': description,
      'icon': icon,
      'isCurrent': isCurrent,
    };
  }

  factory FavoriteLocation.fromMap(Map<String, dynamic> map) {
    return FavoriteLocation(
      city: map['city'] as String,
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      country: map['country'] as String,
      temp: map['temp'] != null ? map['temp'] as int : null,
      description: map['description'] != null ? map['description'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
      isCurrent: map['isCurrent'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteLocation.fromJson(String source) => FavoriteLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  }
