import 'dart:math';

import 'package:recipe_app/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/recipe_full_info.dart';

class RecipeInformation extends StatelessWidget {
  const RecipeInformation({
    Key? key,
    required this.recipeName,
  }) : super(key: key);

  final RecipeName recipeName;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        recipeName.meals.isEmpty
            ? Text(
                recipeName.meals.isEmpty
                    ? "No Information for the thing you looking for"
                    : "",
                style: TextStyle(fontSize: 80),
              )
            : Text(''),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: recipeName.meals.length,
          physics: ScrollPhysics(),
          itemBuilder: ((context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/recipefullinfo',
                      arguments: RecipeFullInfo(
                          meal: recipeName.meals.elementAt(index)));
                },
                child: Card(
                  child: Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        '${recipeName.meals.elementAt(index).strMealThumb}',
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
        ),
      ],
    );
  }
}
