import 'package:flutter/material.dart';
import 'package:recipe_app/core/data/repository/mock_bookmart_repository_impl.dart';
import 'package:recipe_app/core/data/repository/mock_recipe_repository_impl.dart';
import 'package:recipe_app/core/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/screen/saved_recipes_screen.dart';

final _getSavedRecipeUseCase = GetSavedRecipesUseCase(
    recipeRepository: MockRecipeRepositoryImpl(),
    bookmarkRepository: MockBookmartRepositoryImpl());

class SavedRecipesRoot extends StatelessWidget {
  const SavedRecipesRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        SavedRecipesViewModel(getSavedRecipeUseCase: _getSavedRecipeUseCase);

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        if (viewModel.state.isLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SavedRecipesScreen(
          recipes: viewModel.state.recipes,
        );
      },
    );
  }
}
