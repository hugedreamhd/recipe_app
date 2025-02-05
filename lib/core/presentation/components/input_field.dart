import 'package:flutter/material.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class InputField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.label,
    required this.placeholder,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.smallTextReguler,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              //포커스 되지 않았을때의 테두리
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: ColorStyles.gray4,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              //포커스 되었을때의 테두리
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: ColorStyles.primary80,
              ),
            ),
            hintText: placeholder,
            hintStyle: TextStyles.smallerTextReguler.copyWith(
              color: ColorStyles.gray4,
            ),
          ),
        ),
      ],
    );
  }
}
