import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipe_app/pages/profile.dart';
import 'package:recipe_app/pages/recipe.dart';
import 'package:recipe_app/router/router_cubit.dart';
import 'package:recipe_app/router/router_state.dart';
import 'package:recipe_app/pages/favorite.dart';
import 'package:recipe_app/pages/home.dart';

class MyIndex extends StatefulWidget {
  const MyIndex({Key? key}) : super(key: key);

  @override
  State<MyIndex> createState() => _MyIndexState();
}

class _MyIndexState extends State<MyIndex> {
  late final RouterCubit _routerCubit;
  final _pageOptions = <TabData>[
    HomeTabData(),
    RecipeTabData(),
    FavTabData(),
    ProfileTabData()
  ];

  @override
  void initState() {
    super.initState();
    _routerCubit = RouterCubit();
  }

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
      body: BlocBuilder<RouterCubit, RouterState>(
        bloc: _routerCubit,
        builder: (context, state) {
          if (state.isInside<HomeTabData>()) {
            return const HomePage();
          } else if (state.isInside<RecipeTabData>()) {
            return const RecipePage();
          } else if (state.isInside<FavTabData>()) {
            return const FavouritePage();
          } else if (state.isInside<ProfileTabData>()) {
            return const ProfilePage();
          } else {
            assert(false);
            return Container();
          }
        },
      ),

      // Bottom Navigation Bar - To navigate between different pages
      bottomNavigationBar: Container(
        // color: secondaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: GNav(
            color: buttonColor,
            activeColor: primaryColor,
            tabBackgroundColor: buttonColor,
            gap: 8,
            onTabChange: (int index) {
              _routerCubit.push(_pageOptions[index]);
            },
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.dining,
                text: 'Recipe',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favourites',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
