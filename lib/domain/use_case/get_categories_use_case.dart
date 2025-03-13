import 'dart:io';

import 'package:recipe_app/core/domain/error/network_error.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

import '../../core/domain/error/result.dart';

class GetCategoriesUseCase {
  final RecipeRepository _recipeRepository;

  GetCategoriesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Result<List<String>, NetworkError>> execute() async {
    try {
      final recipe = await _recipeRepository.getRecipes();
      return Result.success([
        'All',
        ...recipe.map((e) => e.category).toSet(),
      ]);
    } on SocketException {
      return const Result.error(NetworkError.noInternet);
    } catch (e) {
      return const Result.error(NetworkError.unknown);
    }
  }
}
