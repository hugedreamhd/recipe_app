import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recent_search_recipe_repository.dart';

class MockRecentSearchRecipeRepositoryImpl
    implements RecentSearchRecipeRepository {
  final RecipeDataSource _recipeDataSource;

  MockRecentSearchRecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<List<Recipe>> getRecentSearchRecipes() async {
    final recipes = await _recipeDataSource.getRecipe();
    return recipes.map((e) => Recipe.fromJson(e)).toList();
  }

  @override
  Future<void> updateRecentSearchRecipes(List<Recipe> recipes) {
    // TODO: implement updateRecentSearchRecipes
    throw UnimplementedError();
  }
}
