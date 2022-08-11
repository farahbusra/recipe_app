import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/recipe_detail.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  late final TextEditingController _controller;
  bool _isRecipeNameEmpty = true;
  List<bool> optionSelected = [true, false, false, false, false];

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
                          fontWeight: FontWeight.w700,
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
                          fontWeight: FontWeight.w700,
                          color: paragraphColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Find healthy and nutritious food recipe here!',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Please enter recipe name',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              hintText: 'Food name',
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(buttonColor)),
                      child: const Text('Search'),
                      onPressed: _isRecipeNameEmpty
                          ? null
                          : () {
                              Navigator.pushNamed(context, '/recipedetail',
                                  arguments:
                                      RecipeDetail(foodName: _controller.text));
                            },
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      filteredOption(
                          'Chicken', 'assets/icons8-thanksgiving-50.png', 0),
                      const SizedBox(width: 24),
                      filteredOption('Vege', 'assets/icons8-spinach-50.png', 2),
                      const SizedBox(width: 24),
                      filteredOption('Vege', 'assets/icons8-spinach-50.png', 2),
                      const SizedBox(width: 24),
                      filteredOption(
                          'Fish', 'assets/icons8-fish-food-50.png', 1),
                      const SizedBox(width: 24),
                      filteredOption('Vege', 'assets/icons8-spinach-50.png', 2),
                      const SizedBox(width: 24),
                      filteredOption(
                          'Rice', 'assets/icons8-rice-bowl-50.png', 3),
                      const SizedBox(width: 24),
                      filteredOption('Steak', 'assets/icons8-steak-50.png', 4),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('All Recipe'),
              ],
            ),
          ),
        ));
  }

  Widget filteredOption(String options, String image, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          optionSelected[index] = !optionSelected[index];
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: optionSelected[index]
              ? const Color(0xFFE45858)
              : const Color(0xFFFFFFFE),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [pillOptionShaddow],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: Image.asset(image,
                  color: optionSelected[index]
                      ? const Color(0xFFFFFFFE)
                      : const Color(0xFFE45858)),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              options,
              style: TextStyle(
                color: optionSelected[index]
                    ? const Color(0xFFFFFFFE)
                    : const Color(0xFFE45858),
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxShadow pillOptionShaddow = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 8,
    offset: Offset(0, 0),
  );
}
