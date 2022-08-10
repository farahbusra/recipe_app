import 'package:flutter/material.dart';
import 'package:recipe_app/onboarding/onboarding.dart';
import 'package:recipe_app/pages/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/pages/home_page.dart';
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
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: OnboardingScreen(),
      routes: {
        '/index': (context) => const MyIndex(),
      },
    );
  }
}
