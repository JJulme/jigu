import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/screen/home_screen.dart';
import 'package:jigu/screen/login/login_signup_seller_screen.dart';

class LoginSignup2Screen extends StatefulWidget {
  const LoginSignup2Screen({super.key});

  @override
  State<LoginSignup2Screen> createState() => _LoginSignup2ScreenState();
}

class _LoginSignup2ScreenState extends State<LoginSignup2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("회원가입 완료"),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                width: 230,
                height: 230,
                child: Image.asset(
                  "images/jigu3.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "환영합니다!",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              const Text(
                "지구 가입이 완료되었습니다.",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              const Text(
                "전국의 모든 매장에서 원하는 것을 찾아보세요.",
                style: TextStyle(fontSize: 20),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Get.to(() => const LoginSignupSellerScreen());
                  },
                  child: const Column(
                    children: [
                      Text("사장님 이신가요?", style: TextStyle(fontSize: 15)),
                      Text("사업자정보를 등록하고 홍보해보세요!",
                          style: TextStyle(fontSize: 15)),
                    ],
                  )),
              const SizedBox(height: 10),
              SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(() => const HomeScreen());
                    },
                    child: const Text(
                      "시작하기",
                      style: TextStyle(fontSize: 24),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
