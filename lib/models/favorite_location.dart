import 'package:hive/hive.dart';
part 'favorite_location.g.dart';

@HiveType(typeId: 6)
class FavoriteLocation extends HiveObject {
  @HiveField(0)
  final String city;
  @HiveField(1)
  final double lat;
  @HiveField(2)
  final double lon;
  @HiveField(3)
  final String country;
  @HiveField(4)
  final int? temp;
  @HiveField(5)
  final String? description;
  @HiveField(6)
  final String? icon;

  FavoriteLocation({
    required this.city,
    required this.lat,
    required this.lon,
    required this.country,
    this.temp,
    this.description,
    this.icon,
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
    };
  }

  factory FavoriteLocation.fromMap(Map<String, dynamic> map) {
    return FavoriteLocation(
      city: map['city'] as String,
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      country: map['country'] as String,
      temp: map['temp'] != null ? map['temp'] as int : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
    );
  }
}
