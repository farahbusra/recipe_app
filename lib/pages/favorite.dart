import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipe_app/pages/index.dart';

class recipeCard extends StatelessWidget {
  final String title;

  final String thumbnailUrl;
  recipeCard({
    required this.title,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
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
                style: TextStyle(fontSize: 20, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            child: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 24,
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
              'Favourites',
              style: TextStyle(color: primaryColor),
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
            recipeCard(
              title: "Tomato Soup",
              thumbnailUrl:
                  'https://cdn.mos.cms.futurecdn.net/mUm3dii5LvNDoVJ6VeRhxj-768-80.jpg.webp',
            ),
            recipeCard(
              title: "Chicken and Mushroom Pie",
              thumbnailUrl:
                  'https://cdn.mos.cms.futurecdn.net/ojyy8dW7aDupLbPGjMDgFA-768-80.jpg.webp',
            ),
            recipeCard(
              title: "Macaroni Cheese",
              thumbnailUrl:
                  'https://cdn.mos.cms.futurecdn.net/7hPCQ8T4PH8e7gC4q5GnF4-768-80.jpg.webp',
            ),
            recipeCard(
              title: "Risotto",
              thumbnailUrl:
                  'https://cdn.mos.cms.futurecdn.net/9gqY3eeyvGFDdbwjSH7qkg-768-80.jpg.webp',
            ),
            recipeCard(
              title: "Spaghetti Bolognese",
              thumbnailUrl:
                  'https://cdn.mos.cms.futurecdn.net/pM6x7NJ3TWWW5hS3Y8st8Z-768-80.jpg.webp',
            ),
            recipeCard(
              title: "Chocolate Brownies",
              thumbnailUrl:
                  'https://cdn.mos.cms.futurecdn.net/qAoTS5bzvgYPuHENDtu2n4-768-80.jpg.webp',
            ),
            recipeCard(
              title: "Pizza",
              thumbnailUrl:
                  'https://cdn.mos.cms.futurecdn.net/kHhBBQ9pmMEimcq5PL8SZF-768-80.jpg.webp',
            ),
          ],
        ),
      ),
    );
  }
}
