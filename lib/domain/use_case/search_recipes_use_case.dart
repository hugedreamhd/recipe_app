import 'package:recipe_app/domain/repository/recipe_repository.dart';

import '../model/recipe.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  const SearchRecipesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<Recipe>> execute(String query) async {
    final results = (await _recipeRepository.getRecipes())
        .where((e) => e.name.toLowerCase().contains(query.toLowerCase()));

    return results.toList();
  }
}
