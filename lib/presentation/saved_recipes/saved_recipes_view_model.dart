import 'package:flutter/material.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  SavedRecipesState _state = const SavedRecipesState();

  SavedRecipesState get state => _state;

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipeUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipeUseCase {
    // _loadRecipeData();
    _getSavedRecipesUseCase.execute().listen((recipes) {
      _state = state.copyWith(
        recipes: recipes,
        //상태 업데이트
      );
      notifyListeners();
    });
  }
}
