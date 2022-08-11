import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/pages/recipe_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/pages/recipe_full_info.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  List<bool> optionSelected = [true, false, false, false, false];
  late final TextEditingController _controller;
  bool _isRecipeNameEmpty = true;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        _isRecipeNameEmpty = _controller.text.isEmpty;
      });
    });
  }

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Recipe',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Foodie',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: paragraphColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(
                    Icons.restaurant_menu,
                    color: paragraphColor,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Recipe',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: paragraphColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Find healthy and delicious food recipe here!',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: paragraphColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 260,
                    height: 60,
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          // icon: Icon(Icons.dining, color: buttonColor),
                          hintText: 'Enter Recipe Name',
                          border: OutlineInputBorder()),
                    ),
                    margin: EdgeInsets.only(right: 8),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 80, height: 60),
                    child: Container(
                      padding: EdgeInsets.only(top: 4, bottom: 4),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(buttonColor),
                          // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Search',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        onPressed: _isRecipeNameEmpty
                            ? null
                            : () {
                                Navigator.pushNamed(context, '/recipedetail',
                                    arguments: RecipeDetail(
                                        foodName: _controller.text));
                              },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'All Recipe List',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: paragraphColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 70,
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      filteredOption(
                          'Chicken', 'assets/icons8-thanksgiving-50.png', 0),
                      const SizedBox(width: 16),
                      filteredOption(
                          'Fish', 'assets/icons8-fish-food-50.png', 1),
                      const SizedBox(width: 16),
                      filteredOption('Vege', 'assets/icons8-spinach-50.png', 2),
                      const SizedBox(width: 16),
                      filteredOption(
                          'Rice', 'assets/icons8-rice-bowl-50.png', 3),
                      const SizedBox(width: 16),
                      filteredOption('Steak', 'assets/icons8-steak-50.png', 4),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // Try to recall all the food list
              RecipeList()
            ],
          ),
        ),
      ),
    );
  }

  Widget filteredOption(String options, String image, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          optionSelected[index] = !optionSelected[index];
        });
      },
      child: Row(
        children: [
          Container(
            height: 50,
            width: 120,
            decoration: BoxDecoration(
              color: optionSelected[index]
                  ? const Color(0xFF6246EA)
                  : const Color(0xFFFFFFFE),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              boxShadow: [pillOptionShaddow],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: Image.asset(image,
                      color: optionSelected[index]
                          ? const Color(0xFFFFFFFE)
                          : const Color(0xFF6246EA)),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  options,
                  style: TextStyle(
                    color: optionSelected[index]
                        ? const Color(0xFFFFFFFE)
                        : const Color(0xFF6246EA),
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxShadow pillOptionShaddow = BoxShadow(
    color: const Color.fromARGB(255, 192, 196, 255).withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 8,
    offset: const Offset(0, 0),
  );
}

class RecipeList extends StatelessWidget {
  const RecipeList({required this.recipeName, Key? key}) : super(key: key);

  final RecipeName recipeName;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFFFFFE);
    const paragraphColor = Color(0xFF2B2C34);
    const buttonTextColor = Color(0xFFFFFFFE);
    const buttonColor = Color(0xFF6246EA);
    const secondaryColor = Color(0xFFD1D1E9);
    const tertiaryColor = Color(0xFFE45858);

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: recipeName.meals.length,
      physics: ScrollPhysics(),
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/recipefullinfo',
                arguments:
                    RecipeFullInfo(meal: recipeName.meals.elementAt(index)));
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color:
                      const Color.fromARGB(255, 192, 196, 255).withOpacity(0.4),
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
    );
  }
}
