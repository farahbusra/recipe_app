import 'package:recipe_app/models/recipe_model.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class RecipeService {
  Future<RecipeName> fetchRecipeInformation(String foodName) async {
    final Uri url = Uri(
      scheme: 'https',
      host: 'www.themealdb.com',
      path: 'api/json/v1/1/search.php',
      queryParameters: {
        's': foodName,
      },
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      try {
        return RecipeName.fromJson(response.body);
      } catch (e) {
        print(e);
        rethrow;
      }
    } else {
      throw Exception('Failed to load recipe information');
    }
  }
}
