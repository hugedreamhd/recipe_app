import 'package:flutter/material.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class RatingButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const RatingButton(
    this.text, {
    super.key,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      //Chip 위젯을 사용하여 FilterButton과 같은 모양을 만들어줌
      backgroundColor: isSelected ? ColorStyles.primary100 : ColorStyles.white,
      label: Row(
        mainAxisSize: MainAxisSize.min, //Row의 크기를 최소로 설정
        children: [
          Text(
            text,
            style: TextStyles.smallTextReguler.copyWith(
              color: isSelected ? ColorStyles.white : ColorStyles.primary80,
            ),
          ),
          const SizedBox(width: 0.5),
          Icon(
            Icons.star,
            color: isSelected ? ColorStyles.white : ColorStyles.primary100,
          )
        ],
      ),
      side: const BorderSide(
        color: ColorStyles.primary100,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
