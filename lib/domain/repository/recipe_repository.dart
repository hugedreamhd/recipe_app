import '../model/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes(); //전체 레시피를 얻을 때

  Future<Recipe?> getRecipe(int id); //id를 통해서 1가지만 얻을 때
}
