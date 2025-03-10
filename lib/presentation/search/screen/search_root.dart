import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search/screen/search_screen.dart';
import 'package:recipe_app/presentation/search/search_view_model.dart';

import '../../../core/di/di_setup.dart';

class SearchRoot extends StatelessWidget {
  const SearchRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<SearchViewModel>();

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return SearchScreen(
          state: viewModel.state,
          onChanged: (query) {
            viewModel.searchRecipes(query);
          },
        );
      },
    );
  }
}
