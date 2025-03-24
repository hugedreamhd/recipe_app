import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/ingredient.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientItem({
    super.key,
    required this.ingredient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorStyles.gray4,
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorStyles.white,
            ),
            child: Image.network(
              ingredient.image,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            ingredient.name,
            style: TextStyles.normalTextBold,
          ),
          const Spacer(),
          Text(
            '500g',
            style: TextStyles.smallTextReguler.copyWith(
              color: ColorStyles.gray3,
            ),
          ),
        ],
      ),
    );
  }
}
