import 'package:flutter/material.dart';

import 'filter_buttons.dart';

class SearchFilterSheet extends StatelessWidget {
  const SearchFilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [FilterButtons()],
    );
  }
}
