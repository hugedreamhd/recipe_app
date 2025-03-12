import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';

import '../../../ui/color_styles.dart';

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
          Container(
            height: 173,
            decoration: BoxDecoration(
              color: ColorStyles.gray4,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
