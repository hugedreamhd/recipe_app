import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

import '../../domain/data_source/recipe_data_source.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  MockRecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<Recipe?> getRecipe(int id) async {
    final recipe = await getRecipes();
    return recipe.where((e) => e.id == id).firstOrNull;
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    final recipes = await _recipeDataSource.getRecipe();
    return recipes.map((e) => Recipe.fromJson(e)).toList();
  }
}
