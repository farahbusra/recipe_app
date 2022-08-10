import 'package:recipe_app/models/recipe_model.dart';

abstract class RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final RecipeName recipeName;
  RecipeLoaded({required this.recipeName});

  List<Meal> get meal => recipeName.meals;
}

class RecipeError extends RecipeState {
  final String errorMessage;
  RecipeError({required this.errorMessage});
}
