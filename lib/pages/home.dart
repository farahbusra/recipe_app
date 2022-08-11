import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: SafeArea(
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
                height: 300,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  // children: popularRecipeCard(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//   List<Widget> popularRecipeCard() {
//     List<Widget> popularList = [];
//     // getRecipes basically get the recipe data from API
//     for (var i = 0; i < getRecipes().length; i++) {
//       popularList.add(buildPopularRecipeCard(getRecipes()[i], i));
//     }
//     return popularList;
//   }

//   Widget buildPopularRecipeCard(Recipe recipe, int index) {
//     const primaryColor = Color(0xFFFFFFFE);
//     return Container(
//       decoration: BoxDecoration(
//         color: primaryColor,
//         borderRadius: BorderRadius.all(
//           Radius.circular(12),
//         ),
//         boxShadow: [pillOptionShaddow],
//       ),
//       margin: EdgeInsets.only(
//           right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
//       padding: const EdgeInsets.all(16),
//       width: 220,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: Hero(
//               tag: recipe.image,
//               child: Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('recipe.image'),
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           buildRecipeTitle(recipe.title),
//           buildRecipeParagraph(recipe.description),
//         ],
//       ),
//     );
//   }
// }

  BoxShadow pillOptionShaddow = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 8,
    offset: Offset(0, 0),
  );
}
