import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetCategoriesUseCase {
  final RecipeRepository _recipeRepository;

  GetCategoriesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<String>> execute() async {
    final recipe = await _recipeRepository.getRecipes();
    return [
      'All',
      ...recipe.map((e) => e.category).toSet(),
    ];
  }
}
