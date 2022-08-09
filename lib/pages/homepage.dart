import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipe_app/router/router_cubit.dart';
import 'package:recipe_app/router/router_state.dart';

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
    );
  }
}
