import 'package:recipe_app/models/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeFullInfo extends StatelessWidget {
  const RecipeFullInfo({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

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
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
        ),
        title: Row(
          children: [
            Text(
              'Food Recipe',
              style: TextStyle(color: primaryColor, fontSize: 22),
            ),
            Padding(
              padding: EdgeInsets.only(left: 140),
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
        toolbarHeight: 80,
        elevation: 0,
        centerTitle: true,
        backgroundColor: buttonColor,
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        "${meal.strMealThumb}",
                        width: 350.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${meal.strMeal}",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Card(
                      child: Container(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                "Dish Category",
                                style: TextStyle(fontSize: 21),
                              ),
                              subtitle: Text("${meal.strCategory}",
                                  style: TextStyle(fontSize: 19)),
                            ),
                            ListTile(
                              title: Text(
                                "Dish Origin",
                                style: TextStyle(fontSize: 21),
                              ),
                              subtitle: Text("${meal.strArea}",
                                  style: TextStyle(fontSize: 19)),
                            ),
                            ListTile(
                              title: Text(
                                "Related Taste",
                                style: TextStyle(fontSize: 21),
                              ),
                              subtitle: Text("${meal.strTags}",
                                  style: TextStyle(fontSize: 19)),
                            ),
                          ],
                        ),
                      ),
                      elevation: 4,
                      shadowColor: buttonColor,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                    // Card(
                    //   child: ListTile(
                    //       title: Text(
                    //     "Video: ${meal.strYoutube}",
                    //     style: TextStyle(fontSize: 15),
                    //   )),
                    //   elevation: 4,
                    //   shadowColor: buttonColor,
                    //   margin: EdgeInsets.all(20),
                    //   shape: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: BorderSide(color: Colors.white)),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Card(
                      child: Container(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Ingredients',
                                  style: TextStyle(fontSize: 21)),
                              for (String measure in _getIngredients())
                                Text(
                                  measure,
                                  style: TextStyle(
                                      fontSize: 19,
                                      color:
                                          Color.fromARGB(255, 114, 113, 113)),
                                ),
                            ],
                          ),
                        ),
                      ),
                      elevation: 4,
                      shadowColor: buttonColor,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Card(
                      child: Container(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                "Instructions",
                                style: TextStyle(fontSize: 21),
                              ),
                              subtitle: Text("${meal.strInstructions}",
                                  style: TextStyle(fontSize: 19)),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                      ),
                      elevation: 4,
                      shadowColor: buttonColor,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> _getIngredients() {
    List<String> foodRecipe = [];

    List<String> ingredients = meal.strIngredient
        .toString()
        .substring(1, meal.strIngredient.toString().length - 1)
        .split(',');

    List<String> measures = meal.strMeasure
        .toString()
        .substring(1, meal.strMeasure.toString().length - 1)
        .split(',');

    for (int i = 0; i < ingredients.length; i++) {
      foodRecipe.add('${measures[i]} - ${ingredients[i]}');
    }

    return foodRecipe;
  }
}
