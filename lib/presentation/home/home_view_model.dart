import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/core/domain/error/network_error.dart';
import 'package:recipe_app/core/domain/error/result.dart';
import 'package:recipe_app/domain/use_case/get_categories_use_case.dart';
import 'package:recipe_app/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:recipe_app/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetDishesByCategoryUseCase _getDishesByCategoryUseCase;

  final _eventController =
      StreamController<NetworkError>(); //단발성 상태 에러처리라 UI로 표시하고 말것임

  Stream<NetworkError> get eventStream => _eventController.stream;

  HomeViewModel({
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetDishesByCategoryUseCase getDishesByCategoryUseCase,
  })  : _getCategoriesUseCase = getCategoriesUseCase,
        _getDishesByCategoryUseCase = getDishesByCategoryUseCase {
    _fetchCategories();
  }

  HomeState _state = const HomeState();

  HomeState get state => _state;

  Future<void> _fetchDishesByCategory(String category) async {
    final dishes = await _getDishesByCategoryUseCase.execute(category);
    _state = state.copyWith(dishes: dishes);
    notifyListeners();
  }

  void _fetchCategories() async {
    final result = await _getCategoriesUseCase.execute();

    switch (result) {
      case ResultSuccess<List<String>, NetworkError>():
        _state = state.copyWith(
          categories: result.data,
          selectedCategory: 'All',
        );
        notifyListeners();

        await _fetchDishesByCategory('All');
        notifyListeners();
      case ResultError<List<String>, NetworkError>():
        switch (result.error) {
          case NetworkError.requrestTimeout:
          // TODO: Handle this case.
          case NetworkError.noInternet:
          // TODO: Handle this case.
          case NetworkError.serverError:
          // TODO: Handle this case.q
          case NetworkError.unknown:
          // TODO: Handle this case.
        }
        _eventController.add(result.error);
    }
  }

  void onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();

    await _fetchDishesByCategory(category);
  }
}
