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
    const primaryColor = Color(0xFFFFFFFE);
    const paragraphColor = Color(0xFF2B2C34);
    const buttonTextColor = Color(0xFFFFFFFE);
    const buttonColor = Color(0xFF6246EA);
    const secondaryColor = Color(0xFFD1D1E9);
    const tertiaryColor = Color(0xFFE45858);

    RecipeCubit cubit = BlocProvider.of<RecipeCubit>(context)
      ..fetchRecipe(foodName);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Recipe List',
              style: TextStyle(color: paragraphColor),
            ),
            SizedBox(
              width: 6,
            )
          ],
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: BlocBuilder<RecipeCubit, RecipeState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is RecipeLoading) {
                return const CircularProgressIndicator();
              } else if (state is RecipeLoaded) {
                return RecipeInformation(recipeName: state.recipeName);
              } else {
                return Text(state is RecipeError ? state.errorMessage : '');
              }
            }),
      ),
    );
  }
}
