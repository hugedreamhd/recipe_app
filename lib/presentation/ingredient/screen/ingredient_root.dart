import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_action.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_view_model.dart';
import 'package:recipe_app/presentation/ingredient/screen/ingredient_screen.dart';

import '../../../core/di/di_setup.dart';

class IngredientRoot extends StatelessWidget {
  final int recipeId;

  const IngredientRoot({
    super.key,
    required this.recipeId,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<IngredientViewModel>();
    viewModel.onAction(IngredientAction.loadRecipe(recipeId));

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return viewModel.state.recipe == null
            ? const Center(child: CircularProgressIndicator())
            : IngredientScreen(
                state: viewModel.state,
                onAction: viewModel.onAction,
              );
      },
    );
  }
}
