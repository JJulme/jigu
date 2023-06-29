import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFindPwScreen extends StatefulWidget {
  const LoginFindPwScreen({super.key});

  @override
  State<LoginFindPwScreen> createState() => _LoginFindPwScreenState();
}

class _LoginFindPwScreenState extends State<LoginFindPwScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //키보드 내리기
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text("비밀번호 설정")),
        body: SafeArea(
            child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "abcdefg 님",
                style: TextStyle(fontSize: 25),
              ),
              const Text(
                "비밀번호를 재설정 합니다.",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              myTextField("새로운 비밀번호"),
              const SizedBox(height: 20),
              myTextField("비밀번호를 다시 입력해주세요."),
              const SizedBox(height: 25),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "확 인",
                        style: TextStyle(fontSize: 20),
                      )))
            ],
          ),
        )),
      ),
    );
  }

  Widget myTextField(String text) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          labelText: text,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
