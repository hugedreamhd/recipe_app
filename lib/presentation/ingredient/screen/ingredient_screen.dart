import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/ingredient_item.dart';
import 'package:recipe_app/core/presentation/components/procedure_item.dart';
import 'package:recipe_app/core/presentation/components/small_button.dart';
import 'package:recipe_app/core/presentation/components/two_tab.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_action.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_state.dart';

import '../../../core/presentation/components/chef_profile.dart';
import '../../../core/presentation/components/ingredient_recipe_card.dart';
import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

enum IngredientMenu {
  share,
  rate,
  review,
  unsave,
}

class IngredientScreen extends StatelessWidget {
  final IngredientState state;
  final void Function(IngredientAction action) onAction;
  final void Function(IngredientMenu menu) onTapMenu;

  const IngredientScreen({
    super.key,
    required this.state,
    required this.onTapMenu,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () => onTapMenu(
                    IngredientMenu.share,
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.share,
                        size: 20,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Share',
                        style: TextStyles.smallTextReguler,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () => onTapMenu(
                    IngredientMenu.rate,
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 20,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Rate Recipe',
                        style: TextStyles.smallTextReguler,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () => onTapMenu(
                    IngredientMenu.review,
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.comment,
                        size: 20,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Review',
                        style: TextStyles.smallTextReguler,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () => onTapMenu(
                    IngredientMenu.unsave,
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.bookmark,
                        size: 20,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Unsave',
                        style: TextStyles.smallTextReguler,
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              IngredientRecipeCard(
                recipe: state.recipe!,
                onTapFavorite: (recipe) {},
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const ChefProfile(),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Laura wilson',
                        style: TextStyles.smallTextBold,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: ColorStyles.primary80,
                          ),
                          Text(
                            'Lagos, Nigeria',
                            style: TextStyles.smallerTextReguler.copyWith(
                              color: ColorStyles.gray3,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 85,
                    child: SmallButton('Follow', onPressed: () {}),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TwoTab(
                selectedIndex: state.selectedTabIndex,
                labels: const ['Ingredient', 'Procedure'],
                onChange: (index) {
                  if (index == 0) {
                    onAction(const IngredientAction.onTapIngredient());
                  } else {
                    onAction(const IngredientAction.onTapProcedure());
                  }
                },
              ),
              const SizedBox(
                height: 35,
              ),
              Expanded(
                child: IndexedStack(
                  index: state.selectedTabIndex,
                  children: [
                    IngredientList(state: state),
                    ProcedureList(state: state),
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

class ProcedureList extends StatelessWidget {
  const ProcedureList({
    super.key,
    required this.state,
  });

  final IngredientState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.room_service,
              size: 17,
              color: ColorStyles.gray3,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '1 serve',
              style: TextStyles.smallerTextReguler.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
            const Spacer(),
            Text(
              '${state.procedures.length} Steps',
              style: TextStyles.smallerTextReguler.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 23.5,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: state.procedures.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ProcedureItem(
                    procedure: state.procedures[index],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class IngredientList extends StatelessWidget {
  const IngredientList({
    super.key,
    required this.state,
  });

  final IngredientState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.room_service,
              size: 17,
              color: ColorStyles.gray3,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '1 serve',
              style: TextStyles.smallerTextReguler.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
            const Spacer(),
            Text(
              '${state.ingredients.length} Items',
              style: TextStyles.smallerTextReguler.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 23.5,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: state.ingredients.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  IngredientItem(
                    ingredient: state.ingredients[index],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
