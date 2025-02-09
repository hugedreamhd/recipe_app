import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/components/big_button.dart';
import 'package:recipe_app/core/presentation/components/input_field.dart';
import 'package:recipe_app/ui/text_styles.dart';

import '../../ui/color_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Create an account',
                  style: TextStyles.largeTextBold,
                ),
                const SizedBox(
                  width: 200,
                  child: Text(
                    'Let’s help you set up your account, it won’t take long.',
                    style: TextStyles.smallerTextReguler,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const InputField(
                  label: 'Name',
                  placeholder: 'Enter Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                const InputField(
                  label: 'Email',
                  placeholder: 'Enter Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                const InputField(
                  label: 'Password',
                  placeholder: 'Enter Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                const InputField(
                  label: 'Confirm Password',
                  placeholder: 'Retype Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      value: _isChecked,
                      side: const BorderSide(
                        color: ColorStyles.secondary100,
                      ),
                      activeColor: ColorStyles.secondary100,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      'Accept terms & Condition',
                      style: TextStyles.smallerTextReguler.copyWith(
                        color: ColorStyles.secondary100,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 26,
                ),
                BigButton('Sing Up', onPressed: () {}),
                const SizedBox(
                  height: 14,
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '''Already a member? ''',
                      style: TextStyles.smallerTextBold,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go('/Sign_In');
                      },
                      child: Text(
                        'Sign In',
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
      ),
    );
  }
}
