import 'package:flutter/material.dart';
import 'package:recipe_app/domain/repository/recent_search_recipe_repository.dart';
import 'package:recipe_app/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final RecentSearchRecipeRepository _recentSearchRecipeRepository;

  HomeViewModel({
    required RecentSearchRecipeRepository recentSearchRecipeRepository,
  }) : _recentSearchRecipeRepository = recentSearchRecipeRepository {
    _loadRecentSearchRecipes();
  }

  HomeState _state = const HomeState();

  HomeState get state => _state;

  void _loadRecentSearchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _recentSearchRecipeRepository.getRecentSearchRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }
}
