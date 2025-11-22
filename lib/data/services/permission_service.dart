import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<PermissionStatus> getAccessToSensor() async {
    if (await Permission.sensorsAlways.isGranted) {
      return PermissionStatus.granted;
    }
    final res = await Permission.sensorsAlways.request();
    return res;
  }

  Future<PermissionStatus> getAccessToLocation() async {
    if (await Permission.location.isGranted) {
      return PermissionStatus.granted;
    }
    final res = await Permission.sensorsAlways.request();
    return res;
  }

  Future<PermissionStatus> getAccessToCamera() async {
    if (await Permission.camera.isGranted) {
      return PermissionStatus.granted;
    }
    final res = await Permission.sensorsAlways.request();
    return res;
  }

  Future<PermissionStatus> getAccessToStorage() async {
    if (await Permission.storage.isGranted) {
      return PermissionStatus.granted;
    }
    final res = await Permission.sensorsAlways.request();
    return res;
  }
}
