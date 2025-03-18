import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/recipe.dart';

part 'ingredient_action.freezed.dart';

@freezed
sealed class IngredientAction with _$IngredientAction {
  const factory IngredientAction.onTapFavorite(Recipe recipe) = OnTapFavorite;
  const factory IngredientAction.onTapIngredient(Recipe recipe) =
      OnTapIngredient;
  const factory IngredientAction.onTapProcedure(int recipeId) = OnTapProcedure;
  const factory IngredientAction.onTapFollow(Recipe recipe) = OnTapFollow;
  const factory IngredientAction.loadRecipe(int recipeId) = LoadRecipe;
}
