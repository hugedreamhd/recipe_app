import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final HomeState _state = const HomeState();
  HomeState get state => _state;
}
