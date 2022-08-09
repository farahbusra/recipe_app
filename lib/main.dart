import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipe_app/onboarding/onboarding.dart';
import 'package:recipe_app/router/router_cubit.dart';
import 'package:recipe_app/router/router_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF151026);

    return MaterialApp(
      title: 'Foodie Recipe',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: const OnboardingScreen(),
      routes: {
        '/index': (context) => const HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(
        title: const Text('CookBook'),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0, // Remove App Bar Shadow
      ),
      body: BlocBuilder<RouterCubit, RouterState>(
        bloc: _routerCubit,
        builder: (context, state) {
          if (state.isInside<HomeTabData>()) {
            return const Text("Home page ahead");
          } else if (state.isInside<RecipeTabData>()) {
            return const Text("Recipe page ahead");
          } else if (state.isInside<FavTabData>()) {
            return const Text("Fav page ahead");
          } else if (state.isInside<ProfileTabData>()) {
            return const Text("Profile page ahead");
          } else {
            assert(false);
            return Container();
          }
        },
      ),

      // Bottom Navigation Bar - To navigate between different pages
      bottomNavigationBar: Container(
        // color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                icon: Icons.book,
                text: 'Recipe',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favourite',
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
