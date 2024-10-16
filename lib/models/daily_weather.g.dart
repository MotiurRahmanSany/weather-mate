// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyAdapter extends TypeAdapter<Daily> {
  @override
  final int typeId = 2;

  @override
  Daily read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Daily(
      dt: fields[0] as int?,
      temp: fields[1] as Temp?,
      weather: (fields[2] as List?)?.cast<Weather>(),
    );
  }

  @override
  void write(BinaryWriter writer, Daily obj) {
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
      other is DailyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TempAdapter extends TypeAdapter<Temp> {
  @override
  final int typeId = 3;

  @override
  Temp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Temp(
      min: fields[0] as int?,
      max: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Temp obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.min)
      ..writeByte(1)
      ..write(obj.max);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TempAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
