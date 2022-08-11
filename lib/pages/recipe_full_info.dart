import 'package:recipe_app/models/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeFullInfo extends StatelessWidget {
  const RecipeFullInfo({Key? key, required this.meal}) : super(key: key);

  final Map meal;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFFFFFE);
    const paragraphColor = Color(0xFF2B2C34);
    const buttonTextColor = Color(0xFFFFFFFE);
    const buttonColor = Color(0xFF6246EA);
    const secondaryColor = Color(0xFFD1D1E9);
    const tertiaryColor = Color(0xFFE45858);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
          ),
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Text(
              'Food Recipe',
              style: TextStyle(color: primaryColor, fontSize: 22),
            ),
          ],
        ),
        toolbarHeight: 80,
        elevation: 0,
        centerTitle: true,
        backgroundColor: buttonColor,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      "${meal['strMealThumb']}",
                      width: 350.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: ListTile(
                      title: Text(
                        "${meal['strMeal']}",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      child: ListTile(
                          title: Text(
                        "Dish Category: ${meal['strCategory']}\n\nDish Region: ${meal['strArea']}\n\nRelated Taste: ${meal['strTags']}\n\nRelated Taste: ${meal['strTags']}",
                        style: TextStyle(fontSize: 16),
                      )),
                      elevation: 9,
                      shadowColor: buttonColor,
                      margin: EdgeInsets.all(20),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                        title: Text(
                      "Video: ${meal['strYouTube']}",
                      style: TextStyle(fontSize: 15),
                    )),
                    elevation: 9,
                    shadowColor: buttonColor,
                    margin: EdgeInsets.all(20),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  Card(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (String measure in _getIngredients())
                            Text(
                              measure,
                              style: TextStyle(fontSize: 15),
                            ),
                        ],
                      ),
                    ),
                    elevation: 9,
                    shadowColor: buttonColor,
                    margin: EdgeInsets.all(20),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  Card(
                    child: ListTile(
                        title: Text(
                      "Instructions: ${meal['strInstructions']}",
                      style: TextStyle(fontSize: 15),
                    )),
                    elevation: 9,
                    shadowColor: buttonColor,
                    margin: EdgeInsets.all(20),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> _getIngredients() {
    List<String> foodRecipe = [];

    List<String> ingredients = meal['strIngredient']
        .toString()
        .substring(1, meal['strIngredient'].toString().length - 1)
        .split(',');

    List<String> measures = meal['strMeasure']
        .toString()
        .substring(1, meal['strMeasure'].toString().length - 1)
        .split(',');

    for (int i = 0; i < ingredients.length; i++) {
      foodRecipe.add('${ingredients[i]}: ${measures[i]}');
    }

    return foodRecipe;
  }
}
