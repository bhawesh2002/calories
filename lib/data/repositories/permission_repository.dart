import 'package:calories/data/models/permission_entry.dart';
import 'package:calories/data/services/permission_service.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionRepository {
  final PermissionService _permissionService;
  PermissionRepository({required PermissionService permissionService})
    : _permissionService = permissionService;

  bool isInitialized = false;

  Future<void> initialize() async {
    if (isInitialized) return;
    await accquireDeniedPermissions();
    isInitialized = true;
  }

  List<PermissionEntry> get getLimitedPermissions =>
      PermissionEntry.getPermissionByLevel(PermissionLevel.limited);

  List<PermissionEntry> get getDeniedPermissions =>
      PermissionEntry.getPermissionByLevel(PermissionLevel.denied);

  Future<void> accquireDeniedPermissions() async {
    for (var perm in getDeniedPermissions) {
      await accquirePermission(perm);
    }
  }

  Future<void> accquireLimitedPermissions() async {
    for (var perm in getLimitedPermissions) {
      await accquirePermission(perm);
    }
  }

  Future<void> accquirePermission(PermissionEntry perm) async {
    try {
      late final PermissionStatus status;
      switch (perm.type) {
        case PermissionType.sensor:
          status = await _permissionService.getAccessToSensor();
        case PermissionType.location:
          status = await _permissionService.getAccessToLocation();
        case PermissionType.camera:
          status = await _permissionService.getAccessToCamera();
        case PermissionType.photos:
          status = await _permissionService.getAccessToPhotos();
        case PermissionType.videos:
          status = await _permissionService.getAccessToVideos();
      }

      late final PermissionEntry updatedPerm;
      switch (status) {
        case PermissionStatus.denied ||
            PermissionStatus.restricted ||
            PermissionStatus.permanentlyDenied:
          updatedPerm = perm.copyWith(level: PermissionLevel.denied);
        case PermissionStatus.granted:
          updatedPerm = perm.copyWith(level: PermissionLevel.full);
        case PermissionStatus.limited || PermissionStatus.provisional:
          updatedPerm = perm.copyWith(level: PermissionLevel.limited);
      }

      if (updatedPerm != perm) {
        await updatedPerm.storePermission();
      }
    } catch (e) {
      debugPrint("Error in accquiring permission: $e");
    }
  }
}
