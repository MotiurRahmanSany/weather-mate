// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HourlyAdapter extends TypeAdapter<Hourly> {
  @override
  final int typeId = 1;

  @override
  Hourly read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hourly(
      dt: fields[0] as int?,
      temp: fields[1] as int?,
      weather: (fields[2] as List?)?.cast<Weather>(),
    );
  }

  @override
  void write(BinaryWriter writer, Hourly obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.temp)
      ..writeByte(2)
      ..write(obj.weather);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourlyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
