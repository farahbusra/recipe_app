import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipe_app/pages/index.dart';
import 'package:recipe_app/pages/recipe_detail.dart';

class recipeCard extends StatelessWidget {
  final String title;

  final String thumbnailUrl;
  recipeCard({
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
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.all(8),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: primaryColor,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: buttonColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFFFFFE);
    const paragraphColor = Color(0xFF2B2C34);
    const buttonTextColor = Color(0xFFFFFFFE);
    const buttonColor = Color(0xFF6246EA);
    const secondaryColor = Color(0xFFD1D1E9);
    const tertiar8yColor = Color(0xFFE45858);

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
              'People\'s Favourites',
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
        child: Column(
          children: [
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/recipedetail',
                    arguments: RecipeDetail(foodName: 'chicken'));
              },
              child: recipeCard(
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
              child: recipeCard(
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
              child: recipeCard(
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
              child: recipeCard(
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
              child: recipeCard(
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
              child: recipeCard(
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
              child: recipeCard(
                title: "Egg Dish",
                thumbnailUrl:
                    'https://cdn.mos.cms.futurecdn.net/kHhBBQ9pmMEimcq5PL8SZF-768-80.jpg.webp',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
