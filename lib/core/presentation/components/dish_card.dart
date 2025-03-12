import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;
  final bool isFavorite;

  const DishCard({
    super.key,
    required this.recipe,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 231,
      width: 150,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 173,
              width: 150,
              decoration: BoxDecoration(
                color: ColorStyles.gray4,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: SizedBox(
                  width: 132,
                  height: 42,
                  child: Text(
                    recipe.name,
                    style: TextStyles.smallTextBold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time',
                  style: TextStyles.smallerTextReguler.copyWith(
                    color: ColorStyles.gray3,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  recipe.time,
                  style: TextStyles.smallerTextBold.copyWith(
                    color: ColorStyles.gray1,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: ColorStyles.white),
              child: SizedBox(
                height: 16,
                width: 16,
                child: Image.asset(
                  'assets/images/bookmark.png',
                  color: isFavorite ? ColorStyles.primary80 : ColorStyles.gray3,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: SizedBox(
              width: 109,
              height: 110,
              child: CircleAvatar(
                backgroundImage: NetworkImage(recipe.image),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 105,
            child: Container(
              height: 23,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorStyles.secondary20,
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  const Icon(
                    Icons.star,
                    size: 10,
                    color: ColorStyles.rating,
                  ),
                  const SizedBox(
                    width: 3.5,
                  ),
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
