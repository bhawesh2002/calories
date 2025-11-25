import 'package:calories/data/services/storage_service.dart';

enum PermissionLevel {
  full,
  limited,
  denied;

  bool get hasAccess => this == full || this == limited;
  bool get hasFullAccess => this == full;
  bool get hasLimitedAccess => this == limited;
  bool get isDenied => this == denied;
}

enum PermissionType { sensor, camera, location, photos, videos }

class PermissionEntry {
  final PermissionType _type;
  final PermissionLevel _level;

  PermissionType get type => _type;
  PermissionLevel get level => _level;

  String get name => type.name;

  PermissionEntry({
    required PermissionType type,
    required PermissionLevel level,
  }) : _type = type,
       _level = level;

  PermissionEntry copyWith({PermissionType? type, PermissionLevel? level}) =>
      PermissionEntry(type: type ?? _type, level: level ?? _level);

  Future<void> storePermission() async {
    final box = StorageService.instance.getBox<PermissionEntry>(
      StorageBoxes.permission,
    );
    await box.put(name, this);
  }

  static PermissionEntry? getPermissionByType(PermissionType type) =>
      StorageService.instance
          .getBox<PermissionEntry>(StorageBoxes.permission)
          .get(type.name);

  static List<PermissionEntry> getPermissionByLevel(PermissionLevel level) =>
      StorageService.instance
          .getBox<PermissionEntry>(StorageBoxes.permission)
          .values
          .where((e) => e.level == level)
          .toList();

  @override
  int get hashCode => _type.hashCode ^ _level.hashCode;

  @override
  bool operator ==(covariant PermissionEntry other) {
    if (identical(this, other)) return true;

    return other._type == _type && other._level == _level;
  }

  @override
  String toString() => 'PermissionEntry(_type: $_type, _level: $_level)';
}
