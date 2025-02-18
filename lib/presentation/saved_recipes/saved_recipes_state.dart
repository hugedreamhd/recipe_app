//freezed를 하기위한 파일
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/recipe.dart';

part 'saved_recipes_state.freezed.dart';

@freezed
class SavedRecipesState with _$SavedRecipesState {
  const factory SavedRecipesState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
  }) = _SavedRecipesState;
}
