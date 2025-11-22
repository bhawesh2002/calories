import 'package:calories/data/models/permission_entry.dart';
import 'package:hive_ce/hive.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<PermissionEntry>(),
  AdapterSpec<PermissionLevel>(),
  AdapterSpec<PermissionType>(),
])
class HiveAdapters {}
