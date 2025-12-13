import 'package:calories/data/models/meal.dart';
import 'package:calories/data/models/permission_entry.dart';
import 'package:calories/data/models/the_meal_db_config.dart';
import 'package:hive_ce/hive.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<PermissionEntry>(),
  AdapterSpec<PermissionLevel>(),
  AdapterSpec<PermissionType>(),
  AdapterSpec<TheMealDbConfig>(),
  AdapterSpec<Meal>(),
])
class HiveAdapters {}
