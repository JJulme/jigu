import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFindIdScreen extends StatelessWidget {
  const LoginFindIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("아이디 찾기"),
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                "images/jigu3.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "찾으시는 아이디는",
              style: TextStyle(fontSize: 25),
            ),
            const Text(
              "abcd**** 입니다.",
              style: TextStyle(fontSize: 25),
            ),
            const Spacer(),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("로그인", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
