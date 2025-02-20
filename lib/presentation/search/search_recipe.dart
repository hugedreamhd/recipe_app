import 'package:flutter/material.dart';

class SearchRecipe extends StatelessWidget {
  const SearchRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Recipe'),
      ),
    );
  }
}
