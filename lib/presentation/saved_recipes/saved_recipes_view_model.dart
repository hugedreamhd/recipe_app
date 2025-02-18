import 'package:flutter/material.dart';
import 'package:recipe_app/core/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  SavedRecipesState _state = const SavedRecipesState();

  SavedRecipesState get state => _state;

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipeUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipeUseCase {
    _loadRecipeData();
  }

  void _loadRecipeData() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners(); //로딩 시작 알림

    _state = state.copyWith(
      recipes: await _getSavedRecipesUseCase.execute(),
      isLoading: false, //로딩 종료
    );

    notifyListeners(); //데이터 및 상태 업데이트
  }
}
