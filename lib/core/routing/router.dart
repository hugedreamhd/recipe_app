import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/saved_recipes/screen/saved_recipes_root.dart';
import 'package:recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:recipe_app/presentation/splash_screen/splash_screen.dart';

import 'route_paths.dart';

final router = GoRouter(
  initialLocation: RoutePaths.splashScreen,
  routes: [
    GoRoute(
      path: RoutePaths.splashScreen,
      builder: (context, state) => SplashScreen(
        onTapStartCooking: () {
          context.go(RoutePaths.signIn);
        },
      ),
    ),
    GoRoute(
      path: RoutePaths.signIn,
      builder: (context, state) => SignInScreen(
        onTapSignUp: () {
          context.go(RoutePaths.signUp);
        },
        onTapSignIn: () {
          context.go(RoutePaths.savedRecipes);
        },
      ),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      builder: (context, state) => SignUpScreen(
        onTapSignIn: () {
          context.go(RoutePaths.signIn);
        },
      ),
    ),
    GoRoute(
        path: RoutePaths.savedRecipes,
        builder: (context, state) => const SavedRecipesRoot()),
  ],
);
