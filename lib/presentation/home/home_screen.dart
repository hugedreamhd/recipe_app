import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/seartch_input_field.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  final String name;

  const HomeScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello $name',
                        style: TextStyles.largeTextBold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'what are you cooking today?',
                        style: TextStyles.smallerTextReguler.copyWith(
                          color: ColorStyles.gray3,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ColorStyles.secondary40,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/images/profile1.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Expanded(
                    child: SearchInputField(placeholder: 'Search Recipe'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ColorStyles.primary100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/images/setting.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
