import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/meduim_button.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class SplashScreen extends StatelessWidget {
  final VoidCallback onTapPressed;

  const SplashScreen({
    super.key,
    required this.onTapPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            'assets/images/splash_screen_image.png',
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 104,
                ),
                Image.asset(
                  height: 79,
                  width: 79,
                  'assets/images/splash_screen_crown.png',
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  '100K+ Premium Recipe',
                  style: TextStyles.mediumTextBold.copyWith(
                    color: ColorStyles.white,
                  ),
                ),
                const SizedBox(
                  height: 275,
                ),
                SizedBox(
                  width: 275,
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Get Cooking',
                        style: TextStyles.titleTextBold
                            .copyWith(color: ColorStyles.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Simple way to find Tasty Recipe',
                        style: TextStyles.normalTextReguler.copyWith(
                          color: ColorStyles.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 66),
                  child: MediumButton(
                    'Start Cooking',
                    onPressed: () {
                      onTapPressed();
                    },
                  ),
                ),
                const SizedBox(
                  height: 84,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
