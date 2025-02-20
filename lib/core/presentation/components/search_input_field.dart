import 'package:flutter/material.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class SearchInputField extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;
  final bool isReadOnly;

  const SearchInputField({
    super.key,
    required this.placeholder,
    this.controller,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        readOnly: isReadOnly,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Image.asset('assets/images/search-normal.png'),
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
    );
  }
}
