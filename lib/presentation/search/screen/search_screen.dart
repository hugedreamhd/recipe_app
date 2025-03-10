import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/search_input_field.dart';
import 'package:recipe_app/presentation/search/search_state.dart';

import '../../../core/presentation/components/recipe_grid_item.dart';
import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class SearchScreen extends StatelessWidget {
  final SearchState state;
  final void Function(String query)? onChanged;
  final void Function()? onTapFilter;

  const SearchScreen({
    super.key,
    required this.state,
    this.onChanged,
    this.onTapFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Recipes',
          style: TextStyles.mediumTextBold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 17,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {}, //검색 필드를 탭할때 호출되는 콜백함수
                    child: SearchInputField(
                      placeholder: 'Search Recipe',
                      onChanged: onChanged,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: onTapFilter,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ColorStyles.primary100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/images/setting.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  state.searchTitle,
                  style: TextStyles.normalTextBold,
                ),
                Spacer(),
                Text(
                  state.resultsCount,
                  style: TextStyles.smallerTextReguler.copyWith(
                    color: ColorStyles.gray3,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state.recipes.isEmpty
                      ? const Center(
                          child: Text('No recipes found'),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                          ),
                          itemCount: state.recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = state.recipes[index];
                            return RecipeGridItem(
                              recipe: recipe,
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
