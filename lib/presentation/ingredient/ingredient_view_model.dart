import 'package:flutter/material.dart';
import 'package:recipe_app/domain/repository/ingredient_repository.dart';
import 'package:recipe_app/domain/repository/procedure_repository.dart';
import 'package:recipe_app/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_state.dart';

import 'ingredient_action.dart';

class IngredientViewModel with ChangeNotifier {
  final IngredientRepository _ingredientRepository;
  final ProcedureRepository _procedureRepository;
  final GetDishesByCategoryUseCase _getDishesByCategoryUseCase;

  IngredientState _state = const IngredientState();

  IngredientState get state => _state;

  IngredientViewModel({
    required IngredientRepository ingredientRepository,
    required ProcedureRepository procedureRepository,
    required GetDishesByCategoryUseCase getDishesByCategoryUseCase,
  })  : _ingredientRepository = ingredientRepository,
        _procedureRepository = procedureRepository,
        _getDishesByCategoryUseCase =
            getDishesByCategoryUseCase; //북마크 정보까지 가져올 수 있어서

  void onAction(IngredientAction action) async {
    switch (action) {
      case OnTapFavorite():
        // TODO: Handle this case.
        throw UnimplementedError();
      case OnTapIngredient():
        // TODO: Handle this case.
        throw UnimplementedError();
      case OnTapProcedure():
        // TODO: Handle this case.
        throw UnimplementedError();
      case OnTapFollow():
        // TODO: Handle this case.
        throw UnimplementedError();
      case LoadRecipe():
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  void _getIngredients() async {
    final ingredients = await _ingredientRepository.getIngredients();
    _state = state.copyWith(ingredients: ingredients);
  }

  void _getProcedures() async {
    if (state.recipe != null) {
      final recipeId = state.recipe!.id;
      final prodcedures =
          await _procedureRepository.getProcedureByRecipeId(recipeId);
      _state = state.copyWith(
          procedures:
              prodcedures.where((e) => e.recipeId == recipeId).toList());
      notifyListeners();
    }
  }

  void _loadRecipe(int id) async {
    _getDishesByCategoryUseCase.execute('All').listen((recipes) {
      final recipe = recipes.firstWhere((e) => e.id == id);
      _state = state.copyWith(recipe: recipe);
      notifyListeners();

      _getIngredients();
      _getProcedures();
    });
  }
}
