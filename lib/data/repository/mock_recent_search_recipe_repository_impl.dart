import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recent_search_recipe_repository.dart';

class MockRecentSearchRecipeRepositoryImpl
    implements RecentSearchRecipeRepository {
  @override
  Future<List<Recipe>> getRecentRecipes() {
    // TODO: implement getRecentRecipes
    throw UnimplementedError();
  }

  @override
  Future<void> updateRecentSearchRecipes(List<Recipe> recipes) {
    // TODO: implement updateRecentSearchRecipes
    throw UnimplementedError();
  }
}
