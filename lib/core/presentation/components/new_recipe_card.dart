import 'package:flutter/material.dart';

import '../../../domain/model/recipe.dart';
import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class NewRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const NewRecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 127,
      width: 251,
      child: Stack(
        children: [
          Positioned(
            left: 1,
            top: 32,
            bottom: 1,
            child: Container(
              height: 95,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 42,
            left: 9.3,
            child: SizedBox(
              width: 140,
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                recipe.name,
                style:
                    TextStyles.smallTextBold.copyWith(color: ColorStyles.gray1),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 9.3,
            child: Row(
              children: List.generate(
                recipe.rating.toInt(),
                (index) => const Icon(
                  Icons.star,
                  color: ColorStyles.rating,
                  size: 12,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 9.3,
            child: Row(
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(recipe.image),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  recipe.chef,
                  style: TextStyles.smallerTextReguler.copyWith(
                    color: ColorStyles.gray3,
                  ),
                ),
                // const Icon(
                //   Icons.timer_outlined,
                //   color: ColorStyles.white,
                //   size: 17,
                // ),
              ],
            ),
          ),
          Positioned(
            right: 9.3,
            child: SizedBox(
              width: 80,
              height: 86,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  recipe.image,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 9.3,
            child: Row(
              children: [
                const Icon(
                  Icons.alarm,
                  color: ColorStyles.gray3,
                  size: 17,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  recipe.time,
                  style: TextStyles.smallerTextReguler.copyWith(
                    color: ColorStyles.gray3,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
