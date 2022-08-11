// To parse this JSON data, do
//
//     final recipeName = recipeNameFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class RecipeName {
  RecipeName({
    required this.meals,
  });

  final List<Meal> meals;

  factory RecipeName.fromJson(String str) =>
      RecipeName.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecipeName.fromMap(Map<String, dynamic> json) => RecipeName(
        meals: json["meals"] == null
            ? <Meal>[]
            : List<Meal>.from(json["meals"].map((x) => Meal.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toMap())),
      };
}

class Meal {
  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.strIngredient,
    required this.strMeasure,
    required this.strSource,
    required this.strImageSource,
    required this.strCreativeCommonsConfirmed,
    required this.dateModified,
  });

  final String? idMeal;
  final String? strMeal;
  final String? strDrinkAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final List<String> strIngredient;
  final List<String> strMeasure;
  final String? strSource;
  final String? strImageSource;
  final String? strCreativeCommonsConfirmed;
  final String? dateModified;

  factory Meal.fromJson(String str) => Meal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meal.fromMap(Map<String, dynamic> json) => Meal(
        idMeal: json["idMeal"],
        strMeal: json["strMeal"],
        strDrinkAlternate: json["strDrinkAlternate"],
        strCategory: json["strCategory"] ?? 'Unknown Category',
        strArea: json["strArea"] ?? 'Unknown Region',
        strInstructions: json["strInstructions"] ?? 'No instructions available',
        strMealThumb: json["strMealThumb"] ?? 'No Picture available',
        strTags: json["strTags"] ?? 'No related taste available',
        strYoutube: json["strYoutube"] ?? 'No Video available',
        strIngredient: _getIngredients(json),
        strMeasure: _getMeasures(json),
        strSource: json["strSource"],
        strImageSource: json["strImageSource"],
        strCreativeCommonsConfirmed: json["strCreativeCommonsConfirmed"],
        dateModified: json["dateModified"],
      );

  Map<String, dynamic> toMap() => {
        "idMeal": idMeal,
        "strMeal": strMeal,
        "strDrinkAlternate": strDrinkAlternate,
        "strCategory": strCategory,
        "strArea": strArea,
        "strInstructions": strInstructions,
        "strMealThumb": strMealThumb,
        "strTags": strTags,
        "strYoutube": strYoutube,
        "strIngredient1": <String>[], // TODO(NA): Impleme
        "strMeasure1": <String>[],
        "strSource": strSource,
        "strImageSource": strImageSource,
        "strCreativeCommonsConfirmed": strCreativeCommonsConfirmed,
        "dateModified": dateModified,
      };

  static List<String> _getIngredients(Map<String, dynamic> json) {
    // json["strIngredient1"]

    final List<String> ingredients = <String>[];
    int index = 1;
    while (json['strIngredient$index'] != null &&
        json['strIngredient$index'] != '') {
      ingredients.add(json['strIngredient$index']);
      index++;
    }

    return ingredients;
  }

  static List<String> _getMeasures(Map<String, dynamic> json) {
    final List<String> measures = <String>[];
    int index = 1;
    while (json['strMeasure$index'] != null && json['strMeasure$index'] != '') {
      measures.add(json['strMeasure$index']);
      index++;
    }

    return measures;
  }
}
