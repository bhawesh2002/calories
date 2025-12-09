import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:calories/data/models/meal.dart';
import 'package:calories/data/models/the_meal_db_config.dart';
import 'package:calories/data/services/the_meal_db_service.dart';
import 'package:hive_ce/hive.dart';
import 'package:http/http.dart';

class TheMealDbRepo extends TheMealDbService {
  late final TheMealDbConfig config;

  bool isConfigured = false;
  bool get cacheEnabled => config.enableCache;
  Box<Map<String, dynamic>>? cachedMealsBox;

  @override
  Future<void> configure({
    TheMealDbConfig? config,
    String? apiKey,
    SupportedApiVersion apiVersion = SupportedApiVersion.v1,
  }) async {
    this.config = config ?? TheMealDbConfig();
    super.configure(apiKey: apiKey, apiVersion: apiVersion);
    cachedMealsBox ??= await Hive.openBox('cachedMealsBox');
    isConfigured = true;
  }

  Future<Map<String, dynamic>> _processRequest(
    Future<Response> request,
    bool forceRefresh,
  ) async {
    Future<Map<String, dynamic>> makeRequest() async {
      final response = (await request()) as Response;
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      }
      throw Exception(
        "Request returned with ${response.statusCode} status code. Response Body: ${response.body}",
      );
    }

    Map<String, dynamic>? responseBody;
    if (forceRefresh) {
      responseBody = await makeRequest();
    } else if (cacheEnabled) {
      responseBody = _getFromCache('filterByArea');
      if (responseBody == null || responseBody.isEmpty) {
        responseBody = await makeRequest();
      }
    }
    return responseBody ?? {};
  }

  Map<String, dynamic>? _getFromCache(String key) => cachedMealsBox!.get(key);

  Future<void> _cacheData(String key, Map<String, dynamic> data) async =>
      await cachedMealsBox!.put(key, data);
}
