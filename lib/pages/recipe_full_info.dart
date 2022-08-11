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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dish Recipe',
              style: TextStyle(color: paragraphColor),
            ),
            SizedBox(width: 6),
          ],
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Image.network("${meal['strMealThumb']}"),
              Card(
                child: ListTile(
                    title: Text(
                  "Dish Name: ${meal['strMeal']}",
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
                    title: Text(
                  "Dish Category: ${meal['strCategory']}",
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
                    title: Text(
                  "Dish Region: ${meal['strArea']}",
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
                    title: Text(
                  "Related Taste: ${meal['strTags']}",
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
                    title: Text(
                  "Ingredients: ${meal['strIngredient'].toString().substring(1, meal['strIngredient'].toString().length - 1)}",
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
                    title: Text(
                  "Measurement: ${meal['strMeasure'].toString().substring(1, meal['strMeasure'].toString().length - 1)}",
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
    );
  }
}
