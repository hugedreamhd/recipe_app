import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/home/home_screen.dart';

import '../../core/routing/route_paths.dart';

class HomeRoot extends StatelessWidget {
  const HomeRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      name: 'Jega',
      onTapSearchField: () => context.push(RoutePaths.search),
    );
  }
}
