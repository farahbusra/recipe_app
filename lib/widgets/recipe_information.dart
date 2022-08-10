import 'dart:math';

import 'package:recipe_app/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/recipe_full_info.dart';

class RecipeInformation extends StatelessWidget {
  const RecipeInformation(
      {Key? key, required this.recipeName, required this.meal})
      : super(key: key);

  final RecipeName recipeName;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: recipeName.meals.length,
      physics: ScrollPhysics(),
      itemBuilder: ((context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/recipefullinfo',
                  arguments: RecipeFullInfo(meal: {
                    'strMealThumb':
                        recipeName.meals.elementAt(index).strMealThumb,
                    'strMeal': recipeName.meals.elementAt(index).strMeal,
                    'strCategory':
                        recipeName.meals.elementAt(index).strCategory,
                    'strArea': recipeName.meals.elementAt(index).strArea,
                    'strTags': recipeName.meals.elementAt(index).strTags,
                    'strYouTube': recipeName.meals.elementAt(index).strYoutube,
                    'strIngredient':
                        recipeName.meals.elementAt(index).strIngredient,
                    'strMeasure': recipeName.meals.elementAt(index).strMeasure,
                  }));
            },
            child: Card(
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    '${meal.strMealThumb}',
                    fit: BoxFit.fill,
                    height: 200,
                    width: 150,
                  ),
                  Text(
                    '${recipeName.meals.elementAt(index).strMeal}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )),
            ));
      }),
      // children:
      //   Card(
      //     child: Text(
      //       'Category: ${meal.strCategory}',
      //       style: TextStyle(fontSize: 20),
      //     ),
      //   ),
      //   Card(
      //     child: Text(
      //       'Origin: ${meal.strArea}',
      //       style: TextStyle(fontSize: 20),
      //     ),
      //   ),
      //   Card(
      //     child: Text(
      //       'Tag: ${meal.strTags}',
      //       style: TextStyle(fontSize: 20),
      //     ),
      //   ),
      //   Card(
      //     child: Text(
      //       'Dish: ${meal.strYoutube}',
      //       style: TextStyle(fontSize: 20),
      //     ),
      //   ),
      //   Card(
      //     child: Text(
      //       'Dish: ${meal.strMealThumb}',
      //       style: TextStyle(fontSize: 20),
      //     ),
      //   ),
      //   Card(
      //     child: Text(
      //       'Ingredients: ${meal.strIngredient}',
      //       style: TextStyle(fontSize: 20),
      //     ),
      //   ),
      //   Card(
      //     child: Text(
      //       'Measurements: ${meal.strMeasure}',
      //       style: TextStyle(fontSize: 20),
      //     ),
      //   ),
      //   Card(
      //     child: Text(
      //       'Instructions: ${meal.strInstructions}',
      //       style: TextStyle(fontSize: 20),
      //     ),
      //   ),
      // ],
    );
  }
}
