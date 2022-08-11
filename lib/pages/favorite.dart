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
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            child: Icon(
              Icons.favorite,
              color: tertiaryColor,
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
                    'https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/master/pass/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg',
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
                    'https://reviewed-com-res.cloudinary.com/image/fetch/s--zJ5698MN--/b_white,c_limit,cs_srgb,f_auto,fl_progressive.strip_profile,g_center,q_auto,w_1200/https://reviewed-production.s3.amazonaws.com/1536094589012/pie-hero-getty.jpg',
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
                    'https://www.seriouseats.com/thmb/TfdXOq89J7LQba1ek4xkcXyMiGY=/1500x1125/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__images__2016__09__20160914-cheesy-recipes-roundup-01-bf9fe25f24a640d78bd6dfd0f023eee7.jpg',
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
                    'https://www.saveur.com/uploads/2019/03/04/GZU6HISCWM7SHGMCGXKIQG3CBU.jpg?auto=webp&width=785&height=588.75',
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
                    'https://static.onecms.io/wp-content/uploads/sites/9/2021/03/10/spicy-chicken-curry-FT-RECIPE0321.jpg',
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
                    'https://static.onecms.io/wp-content/uploads/sites/9/2019/11/roast-leg-of-lamb-XL-RECIPE1217.jpg',
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
                    'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F9%2F2021%2F05%2F17%2Fegg-bhurjee-FT-RECIPE0521.jpg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
