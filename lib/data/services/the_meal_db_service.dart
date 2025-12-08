import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

enum MethodType {
  search("search", [AllowedQueryParams.search, AllowedQueryParams.firstLetter]),
  lookup("lookup", [AllowedQueryParams.id]),
  random("random", []),
  randomSelection("randomselection", [], requiresPremium: true),
  list("list", [
    AllowedQueryParams.category,
    AllowedQueryParams.area,
    AllowedQueryParams.ingredient,
  ]),
  categories("categories", []),
  filter("filter", [
    AllowedQueryParams.category,
    AllowedQueryParams.area,
    AllowedQueryParams.ingredient,
  ]),
  latest("latest", [], requiresPremium: true);

  const MethodType(
    this.url,
    this.allowedQueryParams, {
    bool requiresPremium = false,
  });
  final List<AllowedQueryParams> allowedQueryParams;
  final String url;

  bool isParamSupported(AllowedQueryParams queryParam) =>
      allowedQueryParams.contains(queryParam);
  @override
  toString() => url;
}

enum SupportedApiVersion {
  v1("1");

  const SupportedApiVersion(this.version);
  final String version;

  @override
  toString() => version;
}

enum SupportedImageEndpoint {
  mealImage("images/media/meals"),
  ingredientImage("images/ingredients");

  const SupportedImageEndpoint(this.url);
  final String url;
  @override
  toString() => url;
}

enum SupportedImageTypes {
  jpg,
  png;

  @override
  toString() => name;
}

enum ImagePreviewSize {
  small,
  medium,
  large;

  @override
  toString() => name;
}

enum AllowedQueryParams {
  search("s"),
  firstLetter("f"),
  category("c"),
  area("a"),
  ingredient("i"),
  id("i");

  const AllowedQueryParams(this.queryString);
  final String queryString;

  @override
  toString() => name;
}

abstract class TheMealDbService {
  String _apiKey = "1";
  bool get premiumRequestsAllowed => _apiKey != "1";

  SupportedApiVersion _defaultApiVersion = SupportedApiVersion.v1;
  SupportedApiVersion get apiVersion => _defaultApiVersion;

  void configure({
    String? apiKey,
    SupportedApiVersion apiVersion = SupportedApiVersion.v1,
  }) {
    if (apiKey != null) _apiKey = apiKey;
    _defaultApiVersion = apiVersion;
  }

  Future<http.Response> searchMealByNameRequest({required String name}) async {
    try {
      final res = await makeRequest(
        MethodType.search,
        queryParams: {AllowedQueryParams.search: name},
      );
      return res;
    } catch (e, stack) {
      developer.log("Error in searchMealByName", error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<http.Response> searchMealByFirstLetterRequest({
    required String firstLetter,
  }) async {
    try {
      final res = await makeRequest(
        MethodType.search,
        queryParams: {AllowedQueryParams.search: firstLetter[0]},
      );
      return res;
    } catch (e, stack) {
      developer.log(
        "Error in searchMealByFirstLetter",
        error: e,
        stackTrace: stack,
      );
      rethrow;
    }
  }

  Future<http.Response> lookupMealDetailsByIdRequest({required int id}) async {
    try {
      final res = await makeRequest(
        MethodType.lookup,
        queryParams: {AllowedQueryParams.id: id},
      );
      return res;
    } catch (e, stack) {
      developer.log(
        "Error in lookupMealDetailsById",
        error: e,
        stackTrace: stack,
      );
      rethrow;
    }
  }

  Future<http.Response> lookupRandomMealRequest() async {
    try {
      final res = await makeRequest(MethodType.random);
      return res;
    } catch (e, stack) {
      developer.log("Error in lookupRandomMeal", error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<http.Response> lookupTenRandomMealsRequest() async {
    try {
      final res = await makeRequest(MethodType.randomSelection);
      return res;
    } catch (e, stack) {
      developer.log(
        "Error in lookupTenRandomMeals",
        error: e,
        stackTrace: stack,
      );
      rethrow;
    }
  }

  Future<http.Response> listAllMealCategoriesRequest() async {
    try {
      final res = await makeRequest(MethodType.categories);
      return res;
    } catch (e, stack) {
      developer.log(
        "Error in listAllMealCategories",
        error: e,
        stackTrace: stack,
      );
      rethrow;
    }
  }

  Future<http.Response> getLatestMealsRequest() async {
    try {
      final res = await makeRequest(MethodType.latest);
      return res;
    } catch (e, stack) {
      developer.log("Error in getLatestMeals", error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<http.Response> listAllCategoriesRequest() async {
    try {
      final res = await makeRequest(
        MethodType.list,
        queryParams: {AllowedQueryParams.category: "list"},
      );
      return res;
    } catch (e, stack) {
      developer.log("Error in listAllCategories", error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<http.Response> listAllAreasRequest() async {
    try {
      final res = await makeRequest(
        MethodType.list,
        queryParams: {AllowedQueryParams.area: "list"},
      );
      return res;
    } catch (e, stack) {
      developer.log("Error in listAllAreas", error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<http.Response> listAllIngredientsRequest() async {
    try {
      final res = await makeRequest(
        MethodType.list,
        queryParams: {AllowedQueryParams.ingredient: "list"},
      );
      return res;
    } catch (e, stack) {
      developer.log("Error in listAllIngredients", error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<http.Response> filterByIngredientsRequest({
    required List<String> ingredientName,
  }) async {
    try {
      final res = await makeRequest(
        MethodType.filter,
        queryParams: {AllowedQueryParams.ingredient: ingredientName.toString()},
      );
      return res;
    } catch (e, stack) {
      developer.log(
        "Error in filterByMainIngredient",
        error: e,
        stackTrace: stack,
      );
      rethrow;
    }
  }

  Future<http.Response> filterByCategoryRequest({
    required String category,
  }) async {
    try {
      final res = await makeRequest(
        MethodType.filter,
        queryParams: {AllowedQueryParams.category: category},
      );
      return res;
    } catch (e, stack) {
      developer.log("Error in filterByCategory", error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<http.Response> filterByAreaRequest({required String area}) async {
    try {
      final res = await makeRequest(
        MethodType.filter,
        queryParams: {AllowedQueryParams.area: area},
      );
      return res;
    } catch (e, stack) {
      developer.log("Error in filterByArea", error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<http.Response> getMealThumbnailRequest(
    String imageIdentifier,
    ImagePreviewSize size,
  ) async {
    try {
      final url = _constructImageUrl(
        imageIdentifier,
        SupportedImageEndpoint.mealImage,
        SupportedImageTypes.jpg,
      );
      final res = await http.get(url);
      return res;
    } catch (e, stack) {
      developer.log("Error in getMealThumbnail", error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<http.Response> getIngedientThumbnailRequest(
    String imageIdentifier,
    ImagePreviewSize size,
  ) async {
    try {
      final url = _constructImageUrl(
        imageIdentifier,
        SupportedImageEndpoint.ingredientImage,
        SupportedImageTypes.png,
      );
      final res = await http.get(url);
      return res;
    } catch (e, stack) {
      developer.log(
        "Error in getIngedientThumbnail",
        error: e,
        stackTrace: stack,
      );
      rethrow;
    }
  }

  Future<http.Response> makeRequest(
    MethodType type, {
    Map<AllowedQueryParams, dynamic>? queryParams,
    List<String>? pathSegments,
  }) async {
    try {
      final uri = _constructUrl(
        MethodType.search,
        queryParams: queryParams,
        pathSegments: pathSegments,
      );
      final response = await http.get(uri);
      return response;
    } catch (e, stack) {
      developer.log("Error in makeRequest", error: e, stackTrace: stack);
      rethrow;
    }
  }

  Uri _constructUrl(
    MethodType type, {
    Map<AllowedQueryParams, dynamic>? queryParams,
    List<String>? pathSegments,
  }) {
    if (queryParams != null) {
      for (var param in queryParams.keys.toList()) {
        if (!type.isParamSupported(param)) {
          throw UnsupportedQueryParam(type, param);
        }
      }
    }
    final uri = Uri(
      scheme: 'https',
      host: "themealdb.com",
      path: "api/json/$apiVersion/$_apiKey/${type.url}.php",
      pathSegments: pathSegments,
      queryParameters: queryParams?.map((k, v) => MapEntry(k.toString(), v)),
    );
    return uri;
  }

  Uri _constructImageUrl(
    String imageIdentifier,
    SupportedImageEndpoint endpoint,
    SupportedImageTypes imageType, {
    ImagePreviewSize size = ImagePreviewSize.medium,
  }) {
    String getPath() {
      late final String path;
      switch (endpoint) {
        case SupportedImageEndpoint.mealImage:
          path =
              "${endpoint.url}/$imageIdentifier.${imageType.name}/${size.name}";
        case SupportedImageEndpoint.ingredientImage:
          path =
              "${endpoint.url}/$imageIdentifier-${size.name}.${imageType.name}";
      }
      return path;
    }

    final uri = Uri(scheme: 'https', host: "themealdb.com", path: getPath());
    return uri;
  }
}

class UnsupportedQueryParam implements Exception {
  final MethodType type;
  final AllowedQueryParams param;
  UnsupportedQueryParam(this.type, this.param);
  @override
  String toString() {
    return "The method: ${type.name} does not support query param: ${param.name}";
  }
}
