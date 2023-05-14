import 'package:flutter/material.dart';

class MypageSettingScreen extends StatefulWidget {
  const MypageSettingScreen({super.key});

  @override
  State<MypageSettingScreen> createState() => _MypageSettingScreenState();
}

class _MypageSettingScreenState extends State<MypageSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //타이틀 여백 설정 - 없애버림
        titleSpacing: 0,
        title: const Text("환경설정"),
      ),
    );
  }
}
