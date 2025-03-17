import 'package:recipe_app/core/domain/error/result.dart';
import 'package:recipe_app/domain/error/bookmark_error.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

import '../model/recipe.dart';

class ToggleBookmarkRecipeUseCase {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  ToggleBookmarkRecipeUseCase({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  })  : _recipeRepository = recipeRepository,
        _bookmarkRepository = bookmarkRepository;

  Future<Result<List<Recipe>, BookmarkError>> execute(int recipeId) async {
    try {
      final recipe = await _recipeRepository.getRecipe(recipeId);
      if (recipe == null) {
        return const Result.error(BookmarkError.notFound);
      }

      await _bookmarkRepository.toggle(recipeId);
      final recipes = await _recipeRepository.getRecipes();

      final ids = await _bookmarkRepository.getBookmarkIds();

      return Result.success(recipes.map((e) {
        if (ids.contains(e.id)) {
          return e.copyWith(isFavorite: true);
        }
        return e;
      }).toList());
    } catch (e) {
      return const Result.error(BookmarkError.unknown);
    }
  }
}
