import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';

class MainScreen extends StatelessWidget {
  final Widget body; //body 위젯을 받는다
  final int currnetIndex; //현재 인덱스를 받는다
  final void Function(int index) onChangeIndex;
  //인덱스를 변경하는 콜백함수를 받는다(매개 변수 있을때는 void Fuction(매개변수) 형태로 받는다)

  const MainScreen({
    super.key,
    required this.body,
    required this.currnetIndex,
    required this.onChangeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          onChangeIndex(index); //인덱스 변경 콜백함수를 호출한다
        },
        selectedIndex: currnetIndex, //현재 인덱스를 설정한다
        labelBehavior:
            NavigationDestinationLabelBehavior.alwaysHide, //라벨을 항상 숨긴다
        indicatorColor: Colors.transparent, //인디케이터 색상을 투명하게 한다
        destinations: [
          NavigationDestination(
              icon: Image.asset(
                'assets/images/bottom/Inactive_home.png',
              ),
              selectedIcon: Stack(
                children: [
                  Image.asset(
                    'assets/images/bottom/Inactive_home.png',
                    color: ColorStyles.primary100,
                  ),
                  Image.asset(
                    'assets/images/bottom/Active_home.png',
                    color: ColorStyles.primary40,
                  ),
                ],
              ),
              label: 'Home'),
          NavigationDestination(
              icon: Image.asset(
                'assets/images/bottom/Inactive_notification.png',
              ),
              selectedIcon: Stack(
                children: [
                  Image.asset(
                    'assets/images/bottom/Active_notification.png',
                    color: ColorStyles.primary40,
                  ),
                  Image.asset(
                    'assets/images/bottom/Inactive_notification.png',
                    color: ColorStyles.primary100,
                  ),
                ],
              ),
              label: 'Notification'),
          NavigationDestination(
              icon: Image.asset(
                'assets/images/bottom/Inactive_bookmark.png',
              ),
              selectedIcon: Stack(
                children: [
                  Image.asset(
                    'assets/images/bottom/Active_bookmark.png',
                    color: ColorStyles.primary40,
                  ),
                  Image.asset(
                    'assets/images/bottom/Inactive_bookmark.png',
                    color: ColorStyles.primary100,
                  ),
                ],
              ),
              label: 'Bookmark'),
          NavigationDestination(
              icon: Image.asset(
                'assets/images/bottom/Inactive_profile.png',
              ),
              selectedIcon: Stack(
                children: [
                  Image.asset(
                    'assets/images/bottom/Active_profile.png',
                    color: ColorStyles.primary40,
                  ),
                  Image.asset(
                    'assets/images/bottom/Inactive_profile.png',
                    color: ColorStyles.primary100,
                  ),
                ],
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
