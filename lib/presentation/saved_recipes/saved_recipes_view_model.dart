import 'package:flutter/material.dart';
import 'package:recipe_app/core/domain/model/recipe.dart';
import 'package:recipe_app/core/domain/use_case/get_saved_recipes_use_case.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  List<Recipe> _recipes = [];

  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipeUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipeUseCase {
    _loadRecipeData();
  }

  void _loadRecipeData() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _getSavedRecipesUseCase.execute();
  }
}
