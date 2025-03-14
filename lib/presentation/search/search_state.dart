import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/filter/filter_state.dart';
import '../../domain/model/recipe.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
    @Default('Recent Search') String searchTitle,
    @Default('') String resultsCount,
    @Default(FilterState(time: 'All', rate: 1, category: 'All'))
    FilterState filterState,
  }) = _SearchState;
}
