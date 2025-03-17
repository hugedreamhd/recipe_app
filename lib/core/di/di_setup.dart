import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_source/local/default_local_storage.dart';
import 'package:recipe_app/data/data_source/remote/remote_recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/mock_bookmart_repository_impl.dart';
import 'package:recipe_app/data/repository/mock_recipe_repository_impl.dart';
import 'package:recipe_app/domain/data_source/local_storage.dart';
import 'package:recipe_app/domain/data_source/recipe_data_source.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/search_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/toggle_bookmark_recipe_use_case.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/search/search_view_model.dart';

import '../../data/repository/mock_recent_search_recipe_repository_impl.dart';
import '../../domain/repository/recent_search_recipe_repository.dart';
import '../../domain/use_case/get_categories_use_case.dart';
import '../../domain/use_case/get_new_recipes_use_case.dart';

final getIt = GetIt.instance;
// dataSource
void diSetup() {
  getIt.registerSingleton<RecipeDataSource>(RemoteRecipeDataSourceImpl());
  getIt.registerSingleton<LocalStorage>(DefaultLocalStorage());
// repository
  getIt.registerSingleton<RecipeRepository>(
    MockRecipeRepositoryImpl(
      recipeDataSource: getIt(),
    ),
  );
  getIt.registerSingleton<BookmarkRepository>(
    MockBookmartRepositoryImpl(),
  );
  getIt.registerSingleton<RecentSearchRecipeRepository>(
    MockRecentSearchRecipeRepositoryImpl(
      localStorage: getIt(),
    ),
  );
  //useCase
  getIt.registerSingleton(
    GetSavedRecipesUseCase(
      recipeRepository: getIt(),
      bookmarkRepository: getIt(),
    ),
  );
  getIt.registerSingleton(
    SearchRecipesUseCase(
      recipeRepository: getIt(),
      localStorage: getIt(),
    ),
  );

  getIt.registerSingleton(
    GetDishesByCategoryUseCase(
      recipeRepository: getIt(),
      bookmarkRepository: getIt(),
    ),
  );

  getIt.registerSingleton(
    GetCategoriesUseCase(
      recipeRepository: getIt(),
    ),
  );

  getIt.registerSingleton(
    GetNewRecipesUseCase(
      recipeRepository: getIt(),
    ),
  );

  getIt.registerSingleton(
    ToggleBookmarkRecipeUseCase(
      recipeRepository: getIt(),
      bookmarkRepository: getIt(),
    ),
  );

// viewModel
  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(
      getSavedRecipeUseCase: getIt(),
    ),
  );
  getIt.registerFactory<SearchViewModel>(
    () => SearchViewModel(
      recentSearchRecipeRepository: getIt(),
      searchRecipesUseCase: getIt(),
    ),
  );

  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(
      getCategoriesUseCase: getIt(),
      getDishesByCategoryUseCase: getIt(),
      getNewRecipesUseCase: getIt(),
      toggleBookmarkRecipeUseCase: getIt(),
    ),
  );
}
