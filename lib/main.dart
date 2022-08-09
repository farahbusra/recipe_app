import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/pages/home_page.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
