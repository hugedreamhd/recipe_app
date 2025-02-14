import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/big_button.dart';
import 'package:recipe_app/core/presentation/components/input_field.dart';
import 'package:recipe_app/ui/text_styles.dart';

import '../../ui/color_styles.dart';

class SignInScreen extends StatelessWidget {
  final VoidCallback onTapSignUp;
  final VoidCallback onTapSignIn;

  const SignInScreen({
    super.key,
    required this.onTapSignUp,
    required this.onTapSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Hello',
                style: TextStyles.headerTextBold,
              ),
              const Text(
                'Welcome Back!',
                style: TextStyles.largeTextReguler,
              ),
              const SizedBox(
                height: 57,
              ),
              const InputField(
                label: 'Email',
                placeholder: 'Enter Email',
              ),
              const SizedBox(
                height: 30,
              ),
              const InputField(
                label: 'Enter Password',
                placeholder: 'Enter Password',
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Forgot Password',
                style: TextStyles.smallerTextReguler
                    .copyWith(color: ColorStyles.secondary100),
              ),
              const SizedBox(
                height: 20,
              ),
              BigButton(
                'Sing In',
                onPressed: onTapSignIn,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 1,
                    color: ColorStyles.gray4,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    'Or Sign in With',
                    style: TextStyles.smallerTextBold
                        .copyWith(color: ColorStyles.gray4),
                  ),
                  Container(
                    width: 50,
                    height: 1,
                    color: ColorStyles.gray4,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/google_button.png',
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    'assets/images/facebook_button.png',
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
              const SizedBox(
                height: 55,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '''Don't have an account? ''',
                    style: TextStyles.smallerTextBold,
                  ),
                  GestureDetector(
                    onTap: onTapSignUp,
                    child: Text(
                      'Sign Up',
                      style: TextStyles.smallerTextBold
                          .copyWith(color: ColorStyles.secondary100),
                    ),
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
