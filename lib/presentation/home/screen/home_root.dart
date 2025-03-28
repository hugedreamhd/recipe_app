import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/home/home_action.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';
import 'package:recipe_app/presentation/home/screen/home_screen.dart';

import '../../../core/di/di_setup.dart';
import '../../../core/routing/route_paths.dart';

class HomeRoot extends StatelessWidget {
  const HomeRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<HomeViewModel>();

    viewModel.eventStream.listen((event) {
      log(event.toString());
      final snackBar = SnackBar(content: Text(event.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

    return ListenableBuilder(
      builder: (context, snapshot) {
        return HomeScreen(
          state: (viewModel.state),
          onAction: (HomeAction action) {
            if (action is OnTapSearchField) {
              context.push(RoutePaths.search);
              return;
            }
            viewModel.onAction(action);
          },
        );
      },
      listenable: viewModel,
    );
  }
}
