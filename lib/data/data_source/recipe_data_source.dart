abstract interface class RecipeDataSource {
  Future<List<Map<String, dynamic>>> getRecipe();
}
