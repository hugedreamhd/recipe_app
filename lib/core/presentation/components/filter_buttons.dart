import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/filter_button.dart';

class FilterButtons extends StatelessWidget {
  final List<String> items; //전체 아이템
  final String selectedItem; //선택된 아이템
  final void Function(String item) onSelected; //선택된 아이템을 외부로 알리는 콜백

  const FilterButtons({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: items.expand((e) {
        return [
          GestureDetector(
            onTap: () => onSelected(e),
            child: FilterButton(e, isSelected: e == selectedItem),
          ),
          const SizedBox(width: 10),
        ];
      }).toList(),
    );
  }
}
