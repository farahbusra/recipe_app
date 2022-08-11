import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
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
    const primaryColor = Color(0xFFFFFFFE);
    const paragraphColor = Color(0xFF2B2C34);
    const buttonTextColor = Color(0xFFFFFFFE);
    const buttonColor = Color(0xFF6246EA);
    const secondaryColor = Color(0xFFD1D1E9);
    const tertiaryColor = Color(0xFFE45858);

    return ListView(
      children: [
        recipeName.meals.isEmpty
            ? Column(
                children: [
                  Text(
                    recipeName.meals.isEmpty
                        ? "There's no information for the thing you looking for."
                        : "",
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: paragraphColor,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
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
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: const Color.fromARGB(255, 192, 196, 255)
                          .withOpacity(0.4),
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
