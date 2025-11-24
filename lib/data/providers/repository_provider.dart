import 'package:calories/data/providers/service_providers.dart';
import 'package:calories/data/repositories/permission_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final permissionRepoProvider = Provider(
  (ref) => PermissionRepository(
    permissionService: ref.watch(permissionServiceProvider),
  ),
);
