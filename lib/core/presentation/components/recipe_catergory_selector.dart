import 'package:flutter/material.dart';

class RecipeCatergorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final void Function(String category) onSelectCaterogy;

  const RecipeCatergorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelectCaterogy,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categories.map((e) => Text(e)).toList(),
    );
  }
}
