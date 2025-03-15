import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/dish_card.dart';
import 'package:recipe_app/presentation/home/home_state.dart';
import '../../../core/presentation/components/new_recipe_card.dart';
import '../../../core/presentation/components/recipe_category_selector.dart';
import '../../../core/presentation/components/search_input_field.dart';
import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';
import '../home_action.dart';

class HomeScreen extends StatelessWidget {
  final HomeState state;
  final void Function(HomeAction action) onAction; //검색 필드를 탭할때 호출되는 콜백함수

  const HomeScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello ${state.name}',
                              style: TextStyles.largeTextBold,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'what are you cooking today?',
                              style: TextStyles.smallerTextReguler.copyWith(
                                color: ColorStyles.gray3,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: ColorStyles.secondary40,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset('assets/images/profile1.png'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque, //이벤트가 발생하는 영역을 확장
                            onTap: () => onAction(const HomeAction
                                .onTapSearchField()), //검색 필드를 탭할때 호출되는 콜백함수
                            child: const IgnorePointer(
                              //자식 위젯에 대한 이벤트를 무시
                              child: SearchInputField(
                                placeholder: 'Search Recipe',
                                isReadOnly: true,
                              ),
                            ),
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
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 10,
                  bottom: 10,
                ),
                child: RecipeCategorySelector(
                  categories: state.categories,
                  selectedCategory: state.selectedCategory,
                  onSelectCategory: (category) =>
                      onAction(HomeAction.onSelectCategory(category)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.dishes
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: DishCard(
                                recipe: e,
                                isFavorite: true,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'New Recipes',
                      style: TextStyles.normalTextBold,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: state.newRecipes
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: NewRecipeCard(recipe: e),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
