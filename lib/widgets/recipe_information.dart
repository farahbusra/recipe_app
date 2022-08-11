import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/recipe_full_info.dart';

class RecipeInformation extends StatelessWidget {
  const RecipeInformation({
    Key? key,
    required this.recipeName,
  })
  // required this.meal
  : super(key: key);

  final RecipeName recipeName;
  // final Meal meal;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFFFFFE);
    const paragraphColor = Color(0xFF2B2C34);
    const buttonTextColor = Color(0xFFFFFFFE);
    const buttonColor = Color(0xFF6246EA);
    const secondaryColor = Color(0xFFD1D1E9);
    const tertiaryColor = Color(0xFFE45858);

    return ListView(
      children: [
        recipeName.meals.isEmpty
            ? Text(
                recipeName.meals.isEmpty
                    ? "No Information for the thing you looking for"
                    : "",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: paragraphColor,
                  ),
                ),
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
                    arguments: RecipeFullInfo(meal: {
                      'strMealThumb':
                          recipeName.meals.elementAt(index).strMealThumb,
                      'strMeal': recipeName.meals.elementAt(index).strMeal,
                      'strCategory':
                          recipeName.meals.elementAt(index).strCategory,
                      'strArea': recipeName.meals.elementAt(index).strArea,
                      'strTags': recipeName.meals.elementAt(index).strTags,
                      'strYouTube':
                          recipeName.meals.elementAt(index).strYoutube,
                      'strIngredient':
                          recipeName.meals.elementAt(index).strIngredient,
                      'strMeasure':
                          recipeName.meals.elementAt(index).strMeasure,
                      'strInstructions':
                          recipeName.meals.elementAt(index).strInstructions
                    }));
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 16),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromARGB(255, 18, 0, 78).withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        '${recipeName.meals.elementAt(index).strMealThumb}',
                        fit: BoxFit.fill,
                        height: 180,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 200,
                            ),
                            child: //move the contaier here
                                Container(
                              width: 180,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${recipeName.meals.elementAt(index).strMeal}',
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w900,
                                          color: paragraphColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Origin: ${recipeName.meals.elementAt(index).strArea}',
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: paragraphColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
