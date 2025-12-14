import 'package:flutter/foundation.dart';

abstract class BaseMealDBObj<T> {
  final String objId;
  final String objName;
  final String? thumb;

  BaseMealDBObj({
    required this.objId,
    required this.objName,
    required this.thumb,
  });
}

class Meal extends BaseMealDBObj {
  final String? alternateName;
  final String? category;
  final String? area;
  final String? instructions;
  final List<String> tags;
  final String? youtube;
  final List<String> ingredients;
  final List<String> measures;
  final String? source;
  final String? imageSource;
  final String? creativeCommonsConfirmed;
  final DateTime? dateModified;

  Meal({
    required String mealId,
    required String mealName,
    required this.alternateName,
    required this.category,
    required this.area,
    required this.instructions,
    super.thumb,
    required this.tags,
    required this.youtube,
    required this.ingredients,
    required this.measures,
    required this.source,
    required this.imageSource,
    required this.creativeCommonsConfirmed,
    required this.dateModified,
  }) : super(objId: mealId, objName: mealName);

  String get mealId => super.objId;
  String get mealName => super.objName;

  factory Meal.fromResponseMap(Map<String, dynamic> responseBody) {
    final List<String> ingredients = [];
    final List<String> measures = [];
    responseBody.forEach((key, value) {
      if (key.startsWith("strIngredient")) {
        ingredients.add(value);
      }
      if (key.startsWith("strMeasure")) {
        measures.add(value);
      }
    });
    return Meal(
      mealId: responseBody['idMeal'],
      mealName: responseBody["strMeal"],
      alternateName: responseBody["strMealAlternate"],
      category: responseBody["strCategory"],
      area: responseBody["strArea"],
      instructions: responseBody["strInstructions"],
      thumb: responseBody["strMealThumb"],
      tags: responseBody["strTags"],
      youtube: responseBody["strYoutube"],
      ingredients: ingredients,
      measures: measures,
      source: responseBody["strSource"],
      imageSource: responseBody["strImageSource"],
      creativeCommonsConfirmed: responseBody["strCreativeCommonsConfirmed"],
      dateModified: DateTime.parse(responseBody["dateModified"]),
    );
  }

  Meal copyWith({
    String? mealId,
    String? mealName,
    String? alternateName,
    String? category,
    String? area,
    String? instructions,
    String? thumb,
    List<String>? tags,
    String? youtube,
    List<String>? ingredients,
    List<String>? measures,
    String? source,
    String? imageSource,
    String? creativeCommonsConfirmed,
    DateTime? dateModified,
  }) {
    return Meal(
      mealId: mealId ?? this.mealId,
      mealName: mealName ?? this.mealName,
      alternateName: alternateName ?? this.alternateName,
      category: category ?? this.category,
      area: area ?? this.area,
      instructions: instructions ?? this.instructions,
      thumb: thumb ?? this.thumb,
      tags: tags ?? this.tags,
      youtube: youtube ?? this.youtube,
      ingredients: ingredients ?? this.ingredients,
      measures: measures ?? this.measures,
      source: source ?? this.source,
      imageSource: imageSource ?? this.imageSource,
      creativeCommonsConfirmed:
          creativeCommonsConfirmed ?? this.creativeCommonsConfirmed,
      dateModified: dateModified ?? this.dateModified,
    );
  }

  @override
  bool operator ==(covariant Meal other) {
    if (identical(this, other)) return true;

    return other.mealId == mealId &&
        other.mealName == mealName &&
        other.alternateName == alternateName &&
        other.category == category &&
        other.area == area &&
        other.instructions == instructions &&
        other.thumb == thumb &&
        listEquals(other.tags, tags) &&
        other.youtube == youtube &&
        listEquals(other.ingredients, ingredients) &&
        listEquals(other.measures, measures) &&
        other.source == source &&
        other.imageSource == imageSource &&
        other.creativeCommonsConfirmed == creativeCommonsConfirmed &&
        other.dateModified == dateModified;
  }

  @override
  int get hashCode {
    return mealId.hashCode ^
        mealName.hashCode ^
        alternateName.hashCode ^
        category.hashCode ^
        area.hashCode ^
        instructions.hashCode ^
        thumb.hashCode ^
        tags.hashCode ^
        youtube.hashCode ^
        ingredients.hashCode ^
        measures.hashCode ^
        source.hashCode ^
        imageSource.hashCode ^
        creativeCommonsConfirmed.hashCode ^
        dateModified.hashCode;
  }

  @override
  String toString() {
    return 'Meal(mealId: $mealId, mealName: $mealName, alternateName: $alternateName, category: $category, area: $area, instructions: $instructions, thumb: $thumb, tags: $tags, youtube: $youtube, ingredients: $ingredients, measures: $measures, source: $source, imageSource: $imageSource, creativeCommonsConfirmed: $creativeCommonsConfirmed, dateModified: $dateModified)';
  }
}
