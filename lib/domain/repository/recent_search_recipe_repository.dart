import '../model/recipe.dart';

abstract interface class RecentSearchRecipeRepository {
  Future<List<Recipe>> getRecentRecipes();

  Future<void> updateRecentSearchRecipes(List<Recipe> recipes);
}
