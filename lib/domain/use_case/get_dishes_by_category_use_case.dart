import 'package:recipe_app/domain/repository/bookmark_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

import '../model/recipe.dart';

class GetDishesByCategoryUseCase {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  GetDishesByCategoryUseCase({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  })  : _recipeRepository = recipeRepository,
        _bookmarkRepository = bookmarkRepository;

  Stream<List<Recipe>> execute(String category) async* {
    final recipes = await _recipeRepository.getRecipes();
    final filteredRecipes =
        recipes.where((e) => category == 'All' || e.category == category);

    await for (final ids in _bookmarkRepository.bookmarkIdsStream()) {
      yield filteredRecipes
          .map((e) => e.copyWith(isFavorite: ids.contains(e.id)))
          .toList();
    }
  }
}
