// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherDataAdapter extends TypeAdapter<WeatherData> {
  @override
  final int typeId = 0;

  @override
  WeatherData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherData(
      current: fields[0] as Current?,
      hourly: (fields[1] as List?)?.cast<Hourly>(),
      daily: (fields[2] as List?)?.cast<Daily>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.current)
      ..writeByte(1)
      ..write(obj.hourly)
      ..writeByte(2)
      ..write(obj.daily);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
