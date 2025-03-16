import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/recipe.dart';

part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.onTapSearchField() = OnTapSearchField;
  const factory HomeAction.onSelectCategory(String category) = OnSelectCategory;
  const factory HomeAction.onTapFavorite(Recipe recipe) = OnTapFavorite;
}
