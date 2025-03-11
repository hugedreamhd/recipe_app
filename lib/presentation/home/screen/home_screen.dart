import 'package:flutter/material.dart';
import '../../../core/presentation/components/recipe_catergory_selector.dart';
import '../../../core/presentation/components/search_input_field.dart';
import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final void Function() onTapSearchField; //검색 필드를 탭할때 호출되는 콜백함수

  const HomeScreen({
    super.key,
    required this.name,
    required this.onTapSearchField,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello $name',
                            style: TextStyles.largeTextBold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'what are you cooking today?',
                            style: TextStyles.smallerTextReguler.copyWith(
                              color: ColorStyles.gray3,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: ColorStyles.secondary40,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset('assets/images/profile1.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque, //이벤트가 발생하는 영역을 확장
                          onTap: onTapSearchField, //검색 필드를 탭할때 호출되는 콜백함수
                          child: const IgnorePointer(
                            //자식 위젯에 대한 이벤트를 무시
                            child: SearchInputField(
                              placeholder: 'Search Recipe',
                              isReadOnly: true,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: ColorStyles.primary100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset('assets/images/setting.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: RecipeCatergorySelector(
                categories: const [
                  'All',
                  'Indian',
                  'Italian',
                  'Asian',
                  'Chinese',
                ],
                selectedCategory: 'All',
                onSelectCaterogy: (String category) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
