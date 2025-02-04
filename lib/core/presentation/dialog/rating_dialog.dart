import 'package:flutter/material.dart';
<<<<<<< HEAD

class RatingDialog extends StatelessWidget {
  const RatingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
=======
import 'package:recipe_app/core/presentation/components/small_button.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
  final String title;
  final int score; //별 갯수
  final void Function(int score) onScoreChanged; //별 갯수가 바뀔때마다 상태를 알려주는 콜백함수
  final String onScoreSubmitted; //버튼 눌렀을때 호출되는 함수

  const RatingDialog({
    super.key,
    required this.title,
    required this.score,
    required this.onScoreChanged,
    required this.onScoreSubmitted,
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
            print('updated value: $_value');
          });
        },
      ),
      actions: [
        SmallButton(
          widget.onScoreSubmitted,
          textStyle: TextStyles.smallerTextReguler,
          color: ColorStyles.rating,
          onPressed: () {
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
>>>>>>> 3fcaa089a2dce14ee60b9b36176127f30e23c01e
  }
}
