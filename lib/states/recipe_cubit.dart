import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/states/recipe_states.dart';
import 'package:recipe_app/services/recipe_service.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeLoading());

  Future<void> fetchRecipe(String foodName) async {
    RecipeService recipeService = RecipeService();
    emit(RecipeLoading());

    try {
      RecipeName recipeName =
          await recipeService.fetchRecipeInformation(foodName);
      emit(RecipeLoaded(recipeName: recipeName));
    } catch (e) {
      emit(RecipeError(errorMessage: e.toString()));
    }
  }
}
