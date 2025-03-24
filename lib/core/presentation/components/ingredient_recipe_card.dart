import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class IngredientRecipeCard extends StatelessWidget {
  final Recipe recipe;
  final void Function(Recipe recipe) onTapFavorite;

  const IngredientRecipeCard({
    super.key,
    required this.recipe,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 315 / 150,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(recipe.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Row(
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      color: ColorStyles.white,
                      size: 17,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      recipe.time,
                      style: TextStyles.smallTextReguler
                          .copyWith(color: ColorStyles.white),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => onTapFavorite(recipe),
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorStyles.primary20,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            'assets/images/bookmark.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 37,
                  height: 16,
                  decoration: BoxDecoration(
                    color: ColorStyles.secondary20,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: ColorStyles.rating,
                        size: 12,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        recipe.rating.toString(),
                        style: TextStyles.smallerTextReguler,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 194,
                  height: 41,
                  child: Text(
                    recipe.name,
                    style: TextStyles.smallTextBold,
                  ),
                ),
                const Spacer(),
                const Text('(13k Reviews)'),
                const SizedBox(
                  width: 5.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
