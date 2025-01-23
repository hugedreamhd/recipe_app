import 'package:flutter/material.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class MediumButton extends StatefulWidget {
  final String text;
  final void Function() onPressed;

  const MediumButton(
    this.text, {
    super.key,
    required this.onPressed,
  });

  @override
  State<MediumButton> createState() => _MediumButtonState();
}

class _MediumButtonState extends State<MediumButton> {
  bool isPressed = false; //눌렀는지 안눌렀는지 확인하는 변수

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed.call(); //눌렀을때 onPressed 함수 실행
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isPressed ? ColorStyles.gray4 : ColorStyles.primary100,
        ), // 삼항연산자로 눌렀을때(gray4)와 안눌렀을때의 색상(primary100)을 다르게 설정
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 114,
              child: Text(
                widget.text,
                style: TextStyles.normalTextBold.copyWith(
                  color: ColorStyles.white,
                ),
              ),
            ),
            const SizedBox(width: 11),
            const Icon(
              Icons.arrow_forward,
              size: 20,
              color: ColorStyles.white,
            ),
          ],
        ),
      ),
    );
  }
}
