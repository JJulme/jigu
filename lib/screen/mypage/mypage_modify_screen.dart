import 'package:flutter/material.dart';

class MypageModifyScreen extends StatefulWidget {
  const MypageModifyScreen({super.key});

  @override
  State<MypageModifyScreen> createState() => _MypageModifyScreenState();
}

class _MypageModifyScreenState extends State<MypageModifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //타이틀 여백 설정 - 없애버림
        titleSpacing: 0,
        title: const Text("프로필 수정"),
      ),
    );
  }
}
