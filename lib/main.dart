import 'package:flutter/material.dart';
import 'package:recipe_app/ui/text_styles.dart';

import 'core/presentation/components/big_button.dart';
import 'core/presentation/components/meduim_button.dart';
import 'core/presentation/components/small_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Component',
          style: TextStyles.headerTextBold,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BigButton(
              'Big Buttion',
              onPressed: () {
                print('Big Button Pressed');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MediumButton(
              'Medium Buttion',
              onPressed: () {
                print('Medium Button Pressed');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmallButton(
              'Small Buttion',
              onPressed: () {
                print('Small Button Pressed');
              },
            ),
          ),
        ],
      ),
    );
  }
}
