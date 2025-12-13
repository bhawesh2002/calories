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
      case 4:
        return PermissionType.photos;
      case 5:
        return PermissionType.videos;
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
      case PermissionType.photos:
        writer.writeByte(4);
      case PermissionType.videos:
        writer.writeByte(5);
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

class TheMealDbConfigAdapter extends TypeAdapter<TheMealDbConfig> {
  @override
  final typeId = 3;

  @override
  TheMealDbConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TheMealDbConfig(
      enableCache: fields[0] == null ? true : fields[0] as bool,
      refreshDuration: fields[1] == null
          ? TheMealDbConfig.defaultRefreshDuration
          : fields[1] as Duration?,
      forceRefreshOnEveryRequest: fields[2] == null ? false : fields[2] as bool,
      cacheSizeInMb: fields[3] == null ? 10 : (fields[3] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, TheMealDbConfig obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.enableCache)
      ..writeByte(1)
      ..write(obj.refreshDuration)
      ..writeByte(2)
      ..write(obj.forceRefreshOnEveryRequest)
      ..writeByte(3)
      ..write(obj.cacheSizeInMb);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TheMealDbConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MealAdapter extends TypeAdapter<Meal> {
  @override
  final typeId = 4;

  @override
  Meal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meal(
      mealId: fields[0] as String,
      mealName: fields[1] as String,
      alternateName: fields[2] as String?,
      category: fields[3] as String?,
      area: fields[4] as String?,
      instructions: fields[5] as String?,
      thumb: fields[6] as String?,
      tags: (fields[7] as List).cast<String>(),
      youtube: fields[8] as String?,
      ingredients: (fields[9] as List).cast<String>(),
      measures: (fields[10] as List).cast<String>(),
      source: fields[11] as String?,
      imageSource: fields[12] as String?,
      creativeCommonsConfirmed: fields[13] as String?,
      dateModified: fields[14] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Meal obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.mealId)
      ..writeByte(1)
      ..write(obj.mealName)
      ..writeByte(2)
      ..write(obj.alternateName)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.area)
      ..writeByte(5)
      ..write(obj.instructions)
      ..writeByte(6)
      ..write(obj.thumb)
      ..writeByte(7)
      ..write(obj.tags)
      ..writeByte(8)
      ..write(obj.youtube)
      ..writeByte(9)
      ..write(obj.ingredients)
      ..writeByte(10)
      ..write(obj.measures)
      ..writeByte(11)
      ..write(obj.source)
      ..writeByte(12)
      ..write(obj.imageSource)
      ..writeByte(13)
      ..write(obj.creativeCommonsConfirmed)
      ..writeByte(14)
      ..write(obj.dateModified);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
