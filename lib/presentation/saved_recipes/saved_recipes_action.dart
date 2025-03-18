import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/recipe.dart';

part 'saved_recipes_action.freezed.dart';

@freezed
sealed class SavedRecipesAction with _$SavedRecipesAction {
  const factory SavedRecipesAction.onTapFavorite(Recipe recipe) = OnTapFavorite;
  const factory SavedRecipesAction.onTapRecipe(Recipe recipe) = OnTapRecipe;
}
