import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/small_button.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
  final String title;
  final void Function(int score) onScoreChanged; //별 갯수가 바뀔때마다 상태를 알려주는 콜백함수
  final String actionName;

  const RatingDialog({
    super.key,
    required this.title,
    required this.onScoreChanged,
    required this.actionName,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _value = 0; //별 갯수

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        widget.title,
        style: TextStyles.smallTextReguler,
      )),
      content: RatingBar(
        value: _value,
        onChange: (int value) {
          setState(() {
            _value = value;
          });
        },
      ),
      actions: [
        SmallButton(
          widget.actionName,
          textStyle: TextStyles.smallerTextReguler,
          color: ColorStyles.rating,
          onPressed: _value == 0
              ? null
              : () {
                  widget.onScoreChanged(_value);
                },
        ),
      ],
    );
  }
}

class RatingBar extends StatelessWidget {
  final int value;
  final void Function(int index) onChange;

  const RatingBar({
    super.key,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        5,
        (index) {
          return GestureDetector(
            onTapDown: (_) {
              onChange(index + 1);
            },
            child: Icon(
                value - 1 >= index ? Icons.star : Icons.star_border_outlined,
                size: 30,
                color: ColorStyles.rating),
          );
        },
      ),
    );
  }
}
