import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/small_button.dart';

import '../../../ui/text_styles.dart';
import 'filter_buttons.dart';

class SearchFilterSheet extends StatelessWidget {
  const SearchFilterSheet({super.key});

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
            selectedItem: 'Newest',
            onSelected: (String item) {},
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
            selectedItem: '4',
            onSelected: (String item) {},
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
            selectedItem: 'Local Dish',
            onSelected: (String item) {},
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 174,
                child: SmallButton(
                  'Filter',
                  onPressed: () {},
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
