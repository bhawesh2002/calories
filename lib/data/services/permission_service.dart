import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool?> getAccessToSensor() async {
    final res = await Permission.sensorsAlways.request();
    switch (res) {
      case PermissionStatus.denied:
        return false;
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.restricted:
        return false;
      case PermissionStatus.limited:
        return true;
      case PermissionStatus.permanentlyDenied:
        return false;
      case PermissionStatus.provisional:
        return true;
    }
  }
}
