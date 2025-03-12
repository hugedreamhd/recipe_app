import 'package:recipe_app/domain/repository/recipe_repository.dart';

import '../model/recipe.dart';

class GetDishesByCategoryUseCase {
  final RecipeRepository _recipeRepository;

  GetDishesByCategoryUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<Recipe>> execute(String category) async {
    final recipes = await _recipeRepository.getRecipes();

    if (category == 'All') {
      return recipes;
    } else {
      return recipes.where((e) => e.category == category).toList();
    }
  }
}
