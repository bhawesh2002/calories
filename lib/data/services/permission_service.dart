import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<PermissionStatus> getAccessToSensor() async {
    if (await Permission.sensors.isGranted) {
      return PermissionStatus.granted;
    }
    final res = await Permission.sensors.request();
    return res;
  }

  Future<PermissionStatus> getAccessToLocation() async {
    if (await Permission.location.isGranted) {
      return PermissionStatus.granted;
    }
    final res = await Permission.location.request();
    return res;
  }

  Future<PermissionStatus> getAccessToCamera() async {
    if (await Permission.camera.isGranted) {
      return PermissionStatus.granted;
    }
    final res = await Permission.camera.request();
    return res;
  }

  Future<PermissionStatus> getAccessToPhotos() async {
    if (await Permission.photos.isGranted) {
      return PermissionStatus.granted;
    }
    final res = await Permission.photos.request();
    return res;
  }

  Future<PermissionStatus> getAccessToVideos() async {
    if (await Permission.videos.isGranted) {
      return PermissionStatus.granted;
    }
    final res = await Permission.videos.request();
    return res;
  }
}
