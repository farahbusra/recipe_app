import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/pages/favorite.dart';
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
                height: 16,
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
                height: 16,
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
                height: 8,
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
              // Try to recall all the food list
              Container(
                width: 360,
                height: 220,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/recipedetail',
                              arguments: RecipeDetail(foodName: 'chicken'));
                        },
                        child: RecipeList(
                          title: "Chicken Dish",
                          thumbnailUrl:
                              'https://cdn.mos.cms.futurecdn.net/mUm3dii5LvNDoVJ6VeRhxj-768-80.jpg.webp',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/recipedetail',
                              arguments: RecipeDetail(foodName: 'pie'));
                        },
                        child: RecipeList(
                          title: "Pies",
                          thumbnailUrl:
                              'https://cdn.mos.cms.futurecdn.net/ojyy8dW7aDupLbPGjMDgFA-768-80.jpg.webp',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/recipedetail',
                              arguments: RecipeDetail(foodName: 'cheese'));
                        },
                        child: RecipeList(
                          title: "Cheezy",
                          thumbnailUrl:
                              'https://cdn.mos.cms.futurecdn.net/7hPCQ8T4PH8e7gC4q5GnF4-768-80.jpg.webp',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/recipedetail',
                              arguments: RecipeDetail(foodName: 'fish'));
                        },
                        child: RecipeList(
                          title: "Fish Dish",
                          thumbnailUrl:
                              'https://cdn.mos.cms.futurecdn.net/9gqY3eeyvGFDdbwjSH7qkg-768-80.jpg.webp',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/recipedetail',
                              arguments: RecipeDetail(foodName: 'curry'));
                        },
                        child: RecipeList(
                          title: "Curry",
                          thumbnailUrl:
                              'https://cdn.mos.cms.futurecdn.net/pM6x7NJ3TWWW5hS3Y8st8Z-768-80.jpg.webp',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/recipedetail',
                              arguments: RecipeDetail(foodName: 'lamb'));
                        },
                        child: RecipeList(
                          title: "Lamb",
                          thumbnailUrl:
                              'https://cdn.mos.cms.futurecdn.net/qAoTS5bzvgYPuHENDtu2n4-768-80.jpg.webp',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/recipedetail',
                              arguments: RecipeDetail(foodName: 'egg'));
                        },
                        child: RecipeList(
                          title: "Egg Dish",
                          thumbnailUrl:
                              'https://cdn.mos.cms.futurecdn.net/kHhBBQ9pmMEimcq5PL8SZF-768-80.jpg.webp',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/recipedetail',
                              arguments: RecipeDetail(foodName: 'beef'));
                        },
                        child: RecipeList(
                          title: "Something Beefy",
                          thumbnailUrl:
                              'https://cdn.mos.cms.futurecdn.net/pM6x7NJ3TWWW5hS3Y8st8Z-768-80.jpg.webp',
                        ),
                      ),
                    ],
                  ),
                ),
              )
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
  final String title;

  final String thumbnailUrl;
  RecipeList({
    required this.title,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFFFFFE);
    const paragraphColor = Color(0xFF2B2C34);
    const buttonTextColor = Color(0xFFFFFFFE);
    const buttonColor = Color(0xFF6246EA);
    const tertiaryColor = Color(0xFFE45858);

    return Container(
      margin: EdgeInsets.only(
        top: 0,
        right: 20,
        bottom: 30,
        left: 20,
      ),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.38),
            BlendMode.multiply,
          ),
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
