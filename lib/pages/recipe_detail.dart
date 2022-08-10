import 'package:recipe_app/states/recipe_cubit.dart';
import 'package:recipe_app/widgets/recipe_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/recipe_states.dart';

class RecipeDetail extends StatelessWidget {
  final String foodName;

  const RecipeDetail({
    Key? key,
    required this.foodName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecipeCubit cubit = BlocProvider.of<RecipeCubit>(context)
      ..fetchRecipe(foodName);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Recipe Detail'),
      ),
      body: Center(
        child: BlocBuilder<RecipeCubit, RecipeState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is RecipeLoading) {
                return const CircularProgressIndicator();
              } else if (state is RecipeLoaded) {
                return RecipeInformation(
                    recipeName: state.recipeName, meal: state.meal.first);
              } else {
                return Text(state is RecipeError ? state.errorMessage : '');
              }
            }),
      ),
    );
  }
}
