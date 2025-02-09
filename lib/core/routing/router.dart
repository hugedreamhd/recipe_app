import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:recipe_app/presentation/splash_screen/splash_screen.dart';

import '../data/repository/mock_bookmart_repository_impl.dart';
import '../data/repository/mock_recipe_repository_impl.dart';
import '../domain/model/recipe.dart';
import '../domain/use_case/get_saved_recipes_use_case.dart';

final router = GoRouter(
  initialLocation: '/Splash_Screen',
  routes: [
    GoRoute(
      path: '/Splash_Screen',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/Sign_In',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: 'Saved_Recipes',
      builder: (context, state) => FutureBuilder<List<Recipe>>(
        future: GetSavedRecipesUseCase(
          recipeRepository: MockRecipeRepositoryImpl(),
          bookmarkRepository: MockBookmartRepositoryImpl(),
        ).execute(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final recipes = snapshot.data!;

          return SavedRecipesScreen(recipes: recipes);
        },
      ),
    ),
  ],
);
