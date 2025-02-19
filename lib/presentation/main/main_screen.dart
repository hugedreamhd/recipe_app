import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final Widget body; //body 위젯을 받는다
  final int currnetIndex; //현재 인덱스를 받는다
  final void Function(int index)
      onChangeIndex; //인덱스를 변경하는 콜백함수를 받는다(매개 변수 있을때는 void Fuction(매개변수) 형태로 받는다)

  const MainScreen({
    super.key,
    required this.body,
    required this.currnetIndex,
    required this.onChangeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('main screen'),
    );
  }
}
