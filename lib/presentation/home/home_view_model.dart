import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/core/domain/error/network_error.dart';
import 'package:recipe_app/core/domain/error/result.dart';
import 'package:recipe_app/domain/error/new_recipe_error.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/use_case/get_categories_use_case.dart';
import 'package:recipe_app/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:recipe_app/domain/use_case/get_new_recipes_use_case.dart';
import 'package:recipe_app/presentation/home/home_state.dart';

import 'home_action.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetDishesByCategoryUseCase _getDishesByCategoryUseCase;
  final GetNewRecipesUseCase _getNewRecipesUseCase;

  final _eventController =
      StreamController<NetworkError>(); //단발성 상태 에러처리라 UI로 표시하고 말것임

  Stream<NetworkError> get eventStream => _eventController.stream;

  HomeViewModel({
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetDishesByCategoryUseCase getDishesByCategoryUseCase,
    required GetNewRecipesUseCase getNewRecipesUseCase,
  })  : _getCategoriesUseCase = getCategoriesUseCase,
        _getDishesByCategoryUseCase = getDishesByCategoryUseCase,
        _getNewRecipesUseCase = getNewRecipesUseCase {
    _fetchCategories();
    _fetchNewRecipes();
  }

  HomeState _state = const HomeState(name: 'Jega');

  HomeState get state => _state;

  Future<void> _fetchDishesByCategory(String category) async {
    final dishes = await _getDishesByCategoryUseCase.execute(category);
    _state = state.copyWith(dishes: dishes);
    notifyListeners();
  }

  void _fetchCategories() async {
    final result = await _getCategoriesUseCase.execute();

    switch (result) {
      case ResultSuccess<List<String>, NetworkError>():
        _state = state.copyWith(
          categories: result.data,
          selectedCategory: 'All',
        );
        notifyListeners();

        await _fetchDishesByCategory('All');
        notifyListeners();
      case ResultError<List<String>, NetworkError>():
        switch (result.error) {
          case NetworkError.requrestTimeout:
          case NetworkError.noInternet:
          case NetworkError.serverError:
          case NetworkError.unknown:
        }
        _eventController.add(result.error);
    }
  }

  Future<void> _fetchNewRecipes() async {
    final result = await _getNewRecipesUseCase.execute();

    switch (result) {
      case ResultSuccess<List<Recipe>, NewRecipeError>():
        _state = state.copyWith(newRecipes: result.data);
        notifyListeners();

      case ResultError<List<Recipe>, NewRecipeError>():
        switch (result.error) {
          case NewRecipeError.noRecipe:
            throw UnimplementedError();
          case NewRecipeError.invalidCategory:
            throw UnimplementedError();
          case NewRecipeError.unknown:
            throw UnimplementedError();
        }
    }
  }

  void _onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();

    await _fetchDishesByCategory(category);
  }

  void _onTapFavorite(Recipe recipe) async {}

  void onAction(HomeAction action) async {
    switch (action) {
      case OnTapSearchField():
        return;
      case OnSelectCategory():
        _onSelectCategory(action.category);
      case OnTapFavorite():
        _onTapFavorite(action.recipe);
    }
  }
}
