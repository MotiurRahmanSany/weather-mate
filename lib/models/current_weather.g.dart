// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentAdapter extends TypeAdapter<Current> {
  @override
  final int typeId = 4;

  @override
  Current read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Current(
      dt: fields[0] as int?,
      sunrise: fields[1] as int?,
      sunset: fields[2] as int?,
      temp: fields[3] as int?,
      feelsLike: fields[4] as double?,
      pressure: fields[5] as int?,
      humidity: fields[6] as int?,
      uvi: fields[7] as double?,
      clouds: fields[8] as int?,
      visibility: fields[9] as int?,
      windSpeed: fields[10] as double?,
      weather: (fields[11] as List?)?.cast<Weather>(),
    );
  }

  @override
  void write(BinaryWriter writer, Current obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.sunset)
      ..writeByte(3)
      ..write(obj.temp)
      ..writeByte(4)
      ..write(obj.feelsLike)
      ..writeByte(5)
      ..write(obj.pressure)
      ..writeByte(6)
      ..write(obj.humidity)
      ..writeByte(7)
      ..write(obj.uvi)
      ..writeByte(8)
      ..write(obj.clouds)
      ..writeByte(9)
      ..write(obj.visibility)
      ..writeByte(10)
      ..write(obj.windSpeed)
      ..writeByte(11)
      ..write(obj.weather);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 5;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather(
      id: fields[0] as int?,
      main: fields[1] as String?,
      description: fields[2] as String?,
      icon: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.main)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
