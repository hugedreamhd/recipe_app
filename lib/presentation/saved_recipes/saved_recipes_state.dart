import '../../core/domain/model/recipe.dart';

class SavedRecipesState {
  final List<Recipe> recipes;
  final bool isLoading;

  SavedRecipesState({
    this.recipes = const [],
    this.isLoading = false,
  });

  // copyWith 메서드
  SavedRecipesState copyWith({
    List<Recipe>? recipes,
    bool? isLoading,
  }) {
    return SavedRecipesState(
      recipes: recipes ?? this.recipes, // 전달된 값이 null이면 기존 값을 유지
      isLoading: isLoading ?? this.isLoading, // 전달된 값이 null이면 기존 값을 유지
    );
  }
}
