import 'package:calories/data/models/permission_entry.dart';
import 'package:calories/hive/hive_registrar.g.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StorageBoxes {
  permission('permissions', 'hive box for tracking app permissions'),
  recepies('recipies', 'hive box for storing recipies'),
  settings('settings', 'hive box for storing app settings');

  final String boxName;
  final String description;

  const StorageBoxes(this.boxName, this.description);

  static List<String> getBoxNames() =>
      StorageBoxes.values.map((e) => e.boxName).toList();

  @override
  toString() => boxName;
}

class StorageService {
  StorageService._();
  static final StorageService instance = StorageService._();

  late final SharedPreferences prefs;

  bool _setupComplete = false;

  static Future<void> setup() async {
    if (instance._setupComplete) return;
    await instance._setupSharedPrefs();
    await instance._setupHive();
    await instance._configurePermissionStorageBox();
    instance._setupComplete = true;
  }

  Future<void> _setupSharedPrefs() async {
    if (_setupComplete) return;
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> _setupHive() async {
    if (_setupComplete) return;
    final document = await getApplicationDocumentsDirectory();

    await Hive.initFlutter(document.path);
    Hive.registerAdapters();

    for (var box in StorageBoxes.getBoxNames()) {
      await Hive.openBox<PermissionEntry>(box);
    }
  }

  Box<T> getBox<T>(StorageBoxes box) {
    return Hive.box<T>(box.boxName);
  }

  LazyBox<T> getLazyBox<T>(StorageBoxes box) {
    return Hive.lazyBox<T>(box.boxName);
  }

  Future<void> _configurePermissionStorageBox() async {
    final box = getBox<PermissionEntry>(StorageBoxes.permission);

    for (var type in PermissionType.values) {
      if (!box.containsKey(type.name)) {
        box.put(
          type.name,
          PermissionEntry(type: type, level: PermissionLevel.denied),
        );
      }
    }
  }
}
