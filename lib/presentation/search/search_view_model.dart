import 'package:flutter/material.dart';
import 'package:recipe_app/domain/repository/recent_search_recipe_repository.dart';
import 'package:recipe_app/domain/use_case/search_recipes_use_case.dart';

import 'search_state.dart';

class SearchViewModel with ChangeNotifier {
  final RecentSearchRecipeRepository _recentSearchRecipeRepository;
  final SearchRecipesUseCase _searchRecipesUseCase;

  SearchViewModel({
    required RecentSearchRecipeRepository recentSearchRecipeRepository,
    required SearchRecipesUseCase searchRecipesUseCase,
  })  : _recentSearchRecipeRepository = recentSearchRecipeRepository,
        _searchRecipesUseCase = searchRecipesUseCase {
    _loadRecentSearchRecipes();
  }

  SearchState _state = const SearchState();

  SearchState get state => _state;

  void _loadRecentSearchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _recentSearchRecipeRepository.getRecentSearchRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }

  void searchRecipes(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _searchRecipesUseCase.execute(query),
      isLoading: false,
    );
    notifyListeners();
  }
}
