// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepositoryAdapter extends TypeAdapter<Repository> {
  @override
  final int typeId = 0;

  @override
  Repository read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Repository(
      fireStations: (fields[0] as List)
          .map((dynamic e) => (e as Map).cast<String, dynamic>())
          .toList(),
      hospitals: (fields[1] as List)
          .map((dynamic e) => (e as Map).cast<String, dynamic>())
          .toList(),
      policeStations: (fields[2] as List)
          .map((dynamic e) => (e as Map).cast<String, dynamic>())
          .toList(),
      lastUpdated: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Repository obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.fireStations)
      ..writeByte(1)
      ..write(obj.hospitals)
      ..writeByte(2)
      ..write(obj.policeStations)
      ..writeByte(3)
      ..write(obj.lastUpdated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepositoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
