import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/small_button.dart';
import 'package:recipe_app/domain/filter/filter_state.dart';

import '../../../ui/text_styles.dart';
import 'filter_buttons.dart';

class SearchFilterSheet extends StatefulWidget {
  final FilterState filterState;
  final void Function(FilterState state) onChangeFilter;

  const SearchFilterSheet({
    super.key,
    required this.filterState,
    required this.onChangeFilter,
  });

  @override
  State<SearchFilterSheet> createState() => _SearchFilterSheetState();
}

class _SearchFilterSheetState extends State<SearchFilterSheet> {
  late FilterState _filterState;

  @override
  void initState() {
    super.initState();

    _filterState = widget.filterState;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min, //화면 구성에 맞게 크기 가장 작게
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 31,
          ),
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Filter Search',
              style: TextStyles.smallTextBold,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Time',
            style: TextStyles.smallTextBold,
          ),
          const SizedBox(
            height: 10,
          ),
          FilterButtons(
            items: const ['All', 'Newest', 'Oldest', 'Popularity'],
            selectedItem: _filterState.time,
            onSelected: (String item) {
              setState(() {
                _filterState = _filterState.copyWith(time: item);
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Rate',
            style: TextStyles.smallTextBold,
          ),
          const SizedBox(
            height: 10,
          ),
          FilterButtons(
            items: const ['5', '4', '3', '2', '1'],
            selectedItem: _filterState.rate.toString(),
            onSelected: (String item) {
              setState(() {
                _filterState = _filterState.copyWith(rate: int.parse(item));
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Category',
            style: TextStyles.smallTextBold,
          ),
          const SizedBox(
            height: 10,
          ),
          FilterButtons(
            items: const [
              'All',
              'Cereal',
              'Vegetables',
              'Dinner',
              'Chinese',
              'Local Dish',
              'Fruit',
              'BreakFast',
              'Spanish',
              'Lunch'
            ],
            selectedItem: _filterState.category,
            onSelected: (String item) {
              setState(() {
                _filterState = _filterState.copyWith(category: item);
              });
            },
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 174,
                child: SmallButton(
                  'Filter',
                  onPressed: () {
                    widget.onChangeFilter(_filterState);
                  },
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
