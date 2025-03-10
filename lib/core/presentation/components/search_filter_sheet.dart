import 'package:flutter/material.dart';

import '../../../ui/text_styles.dart';
import 'filter_buttons.dart';

class SearchFilterSheet extends StatelessWidget {
  const SearchFilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 31,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Filter Search',
              style: TextStyles.smallTextBold,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Time',
            style: TextStyles.smallTextBold,
          ),
          SizedBox(
            height: 20,
          ),
          FilterButtons(),
        ],
      ),
    );
  }
}
