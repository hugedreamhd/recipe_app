import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/recipe_card.dart';
import 'package:recipe_app/core/presentation/components/search_input_field.dart';
import 'package:recipe_app/presentation/search/search_state.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class SearchScreen extends StatelessWidget {
  final SearchState state;

  const SearchScreen({
    super.key,
    required this.state,
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
                    child: const SearchInputField(placeholder: 'Search Recipe'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: ColorStyles.primary100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/setting.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Recent Search', style: TextStyles.normalTextBold),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        final recipe = state.recipes[index];
                        return RecipeCard(
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
