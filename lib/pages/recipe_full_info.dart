import 'package:recipe_app/models/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeFullInfo extends StatelessWidget {
  const RecipeFullInfo({Key? key, required this.meal}) : super(key: key);

  final Map meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Full Info test')),
      body: Column(
        children: [
          Image.network("${meal['strMealThumb']}"),
          Text("${meal['strMeal']}"),
          Text("${meal['strCategory']}"),
          Text("${meal['strArea']}"),
          Text("${meal['strTags']}"),
          Text("${meal['strYouTube']}"),
          Text("${meal['strIngredient']}"),
          Text("${meal['strMeasure']}"),

          // Image.network('${meal.strMealThumb}'),
          // Text('${meal.strMeal}', style: TextStyle(fontSize: 20)),
          // Text(
          //   'Category: ${meal.strCategory}',
          //   style: TextStyle(fontSize: 20),
          // ),
          // Text(
          //   'Origin: ${meal.strArea}',
          //   style: TextStyle(fontSize: 20),
          // ),
          // Text(
          //   'Tag: ${meal.strTags}',
          //   style: TextStyle(fontSize: 20),
          // ),
          // Text(
          //   'Dish: ${meal.strYoutube}',
          //   style: TextStyle(fontSize: 20),
          // ),
          // Text(
          //   'Dish: ${meal.strMealThumb}',
          //   style: TextStyle(fontSize: 20),
          // ),
          // Text(
          //   'Ingredients: ${meal.strIngredient}',
          //   style: TextStyle(fontSize: 20),
          // ),
          // Text(
          //   'Measurements: ${meal.strMeasure}',
          //   style: TextStyle(fontSize: 20),
          // ),
          // Text(
          //   'Instructions: ${meal.strInstructions}',
          //   style: TextStyle(fontSize: 20),
          // ),
        ],
      ),
    );
  }
}
