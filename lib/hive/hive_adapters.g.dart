// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class PermissionEntryAdapter extends TypeAdapter<PermissionEntry> {
  @override
  final typeId = 0;

  @override
  PermissionEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PermissionEntry(
      type: fields[2] as PermissionType,
      level: fields[1] as PermissionLevel,
    );
  }

  @override
  void write(BinaryWriter writer, PermissionEntry obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.level)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PermissionEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PermissionLevelAdapter extends TypeAdapter<PermissionLevel> {
  @override
  final typeId = 1;

  @override
  PermissionLevel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PermissionLevel.full;
      case 1:
        return PermissionLevel.limited;
      case 2:
        return PermissionLevel.denied;
      default:
        return PermissionLevel.full;
    }
  }

  @override
  void write(BinaryWriter writer, PermissionLevel obj) {
    switch (obj) {
      case PermissionLevel.full:
        writer.writeByte(0);
      case PermissionLevel.limited:
        writer.writeByte(1);
      case PermissionLevel.denied:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PermissionLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PermissionTypeAdapter extends TypeAdapter<PermissionType> {
  @override
  final typeId = 2;

  @override
  PermissionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PermissionType.sensor;
      case 1:
        return PermissionType.camera;
      case 2:
        return PermissionType.location;
      case 3:
        return PermissionType.storage;
      default:
        return PermissionType.sensor;
    }
  }

  @override
  void write(BinaryWriter writer, PermissionType obj) {
    switch (obj) {
      case PermissionType.sensor:
        writer.writeByte(0);
      case PermissionType.camera:
        writer.writeByte(1);
      case PermissionType.location:
        writer.writeByte(2);
      case PermissionType.storage:
        writer.writeByte(3);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PermissionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
