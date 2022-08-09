import 'package:recipe_app/models/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeInformation extends StatelessWidget {
  const RecipeInformation(
      {Key? key, required this.recipeName, required this.meal})
      : super(key: key);

  final RecipeName recipeName;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Text(
            'Dish: ${meal.strMeal}',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Card(
          child: Text(
            'Category: ${meal.strCategory}',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Card(
          child: Text(
            'Origin: ${meal.strArea}',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Card(
          child: Text(
            'Tag: ${meal.strTags}',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Card(
          child: Text(
            'Dish: ${meal.strYoutube}',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Card(
          child: Text(
            'Dish: ${meal.strMealThumb}',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
