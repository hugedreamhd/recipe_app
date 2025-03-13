import 'package:recipe_app/domain/error/new_recipe_error.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

import '../../core/domain/error/result.dart';
import '../model/recipe.dart';

class GetNewRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetNewRecipesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Result<List<Recipe>, NewRecipeError>> execute() async {
    try {
      final recipes = await _recipeRepository.getRecipes();

      if (recipes.isEmpty) {
        return const Result.error(NewRecipeError.noRecipe);
      }

      if (recipes.any((e) => e.category.isEmpty)) {
        return const Result.error(NewRecipeError.invalidCategory);
      }

      return Result.success(recipes.take(5).toList());
    } catch (e) {
      return const Result.error(NewRecipeError.unknown);
    }
  }
}
