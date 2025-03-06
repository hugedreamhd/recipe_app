import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class RecipeGridItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeGridItem({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(recipe.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  height: 42,
                  child: Text(
                    recipe.name,
                    style:
                        TextStyles.smallTextBold.copyWith(color: Colors.white),
                  ),
                ),
                Text(
                  'By ${recipe.chef}',
                  style: TextStyles.smallerTextReguler
                      .copyWith(color: Colors.white),
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
    );
  }
}
