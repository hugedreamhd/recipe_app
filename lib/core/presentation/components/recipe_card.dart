import 'package:flutter/material.dart';
import 'package:recipe_app/core/domain/model/recipe.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
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
                const ClipOval()
                // Container(
                //   width: 24,
                //   height: 24,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: ColorStyles.primary20,
                //   ),
                //   child: Image.asset(
                //     'assets/images/bookmark.png',
                //     fit: BoxFit.cover,
                //   ),
                // ),
                // Container(
                //   width: 20,
                //   height: 20,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     image: DecorationImage(
                //       image: AssetImage('assets/images/bookmark.png'),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
