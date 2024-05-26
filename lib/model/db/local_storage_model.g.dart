// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalStoreAdapter extends TypeAdapter<LocalStore> {
  @override
  final int typeId = 0;

  @override
  LocalStore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalStore(
      location: fields[0] as String,
      description: fields[1] as String,
      temp: fields[2] as double,
      feelsLike: fields[3] as double,
      pressure: fields[4] as int,
      humidity: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LocalStore obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.temp)
      ..writeByte(3)
      ..write(obj.feelsLike)
      ..writeByte(4)
      ..write(obj.pressure)
      ..writeByte(5)
      ..write(obj.humidity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalStoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
