import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/filter_button.dart';
import 'package:recipe_app/core/presentation/components/input_field.dart';
import 'package:recipe_app/core/presentation/components/two_tab.dart';
import 'package:recipe_app/core/presentation/dialog/rating_dialog.dart';

import 'package:recipe_app/ui/text_styles.dart';

import 'core/presentation/components/big_button.dart';
import 'core/presentation/components/meduim_button.dart';

import 'core/presentation/components/rating_button.dart';
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
        title:  const Text(
          'Component',
          style: TextStyles.headerTextBold,
        ),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {

                    return RatingDialog(
                      title: 'Rate Recipe',
                      score: 3,
                      onScoreChanged: (score) {
                        print('onScoreChanged');
                      },
                      onScoreSubmitted: 'Send',
                    );
                  });
            },
            child: const Text('Rating Dialog', {required TextStyle style}),

          ),
          TwoTab(
            labels: const [
              'label1',
              'label2',
            ],
            selectedIndex: 1,
            onChange: (int index) {
              print('TwoTab : $index');
            },
          ),
          const RatingButton('text'),
          const RatingButton('text', isSelected: true),
          const FilterButton('text'),
          const FilterButton('text', isSelected: true),
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: InputField(
              label: 'Label',
              placeholder: 'placeholder',
            ),
          ),
        ],
      ),
    );
  }
}
