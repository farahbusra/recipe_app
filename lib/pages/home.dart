import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/pages/favorite.dart';
import 'package:recipe_app/pages/recipe_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Foodie',
              style: TextStyle(color: primaryColor, fontSize: 22),
            ),
            SizedBox(width: 6),
            Icon(
              Icons.restaurant_menu,
              color: primaryColor,
            ),
            SizedBox(width: 6),
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  'Hello, Natalie!',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: paragraphColor,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Make your own food,',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: paragraphColor,
                    ),
                  ),
                ),
                Text(
                  'stay at home!',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: tertiaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Landing Page Banner
                const SizedBox(height: 12),
                Text(
                  'Popular Recipes',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: paragraphColor,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 10,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    // children: popularRecipeCard(),
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/recipedetail',
                            arguments: RecipeDetail(foodName: 'beef'));
                      },
                      child: recipeCard(
                        title: "Beef Dish",
                        thumbnailUrl:
                            'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F9%2F2021%2F05%2F17%2Fgarlic-butter-prime-rib-FT-RECIPE0621.jpg',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/recipedetail',
                            arguments: RecipeDetail(foodName: 'soup'));
                      },
                      child: recipeCard(
                        title: "Soups",
                        thumbnailUrl:
                            'https://static.onecms.io/wp-content/uploads/sites/9/2020/01/201308-ft-tomato-soup-with-chickpeas-and-pasta-2000.jpg',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/recipedetail',
                            arguments: RecipeDetail(foodName: 'cake'));
                      },
                      child: recipeCard(
                        title: "Cakes",
                        thumbnailUrl:
                            'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F9%2F2021%2F05%2F04%2Frhubarb-upside-down-cake-FT-RECIPE0521.jpg',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
