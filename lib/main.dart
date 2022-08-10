import 'package:flutter/material.dart';
import 'package:recipe_app/onboarding/onboarding.dart';
import 'package:recipe_app/pages/home.dart';
import 'package:recipe_app/pages/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/pages/recipe_detail.dart';
import 'package:recipe_app/pages/recipe_full_info.dart';
import 'package:recipe_app/states/recipe_cubit.dart';

void main() {
  runApp(BlocProvider<RecipeCubit>(
      create: (_) => RecipeCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie Recipe',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => HomePage());
          case '/recipedetail':
            RecipeDetail data = settings.arguments as RecipeDetail;
            return MaterialPageRoute(
                builder: (context) => RecipeDetail(foodName: data.foodName));
          case '/recipefullinfo':
            RecipeFullInfo data = settings.arguments as RecipeFullInfo;
            return MaterialPageRoute(
              builder: (context) => RecipeFullInfo(meal: data.meal),
            );
        }
      },
      home: OnboardingScreen(),
      routes: {
        '/index': (context) => const MyIndex(),
      },
    );
  }
}
