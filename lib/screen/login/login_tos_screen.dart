import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/screen/login/login_signup_screen.dart';
//https://velog.io/@soonmuu/flutter-%EC%9E%A5%EB%B0%94%EA%B5%AC%EB%8B%88-%EB%A6%AC%EC%8A%A4%ED%8A%B8-%EB%8B%A4%EC%A4%91%EC%84%A0%ED%83%9D-%EB%B0%8F-%ED%95%B4%EC%A0%9C

class LoginTosScreen extends StatefulWidget {
  const LoginTosScreen({super.key});

  @override
  State<LoginTosScreen> createState() => _LoginTosScreenState();
}

class _LoginTosScreenState extends State<LoginTosScreen> {
  bool _allCheck = false;
  bool _check1 = false;
  bool _check2 = false;
  bool _check3 = false;
  void _stateChecker() {
    if (_allCheck == true) {
      setState(() {
        _check1 = true;
        _check2 = true;
        _check3 = true;
      });
    }
  }

  //bool 값에 따라 반환하는 아이콘 색이 바뀜
  dynamic changeIcon({required bool checked}) {
    return checked
        ? const Icon(Icons.check_circle, size: 35, color: Colors.indigo)
        : const Icon(Icons.check_circle_outline, size: 35, color: Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //전체 동의하기
            InkWell(
              onTap: () {
                setState(() {
                  _allCheck = !_allCheck;
                });
              },
              child: SizedBox(
                width: 190,
                child: Row(
                  children: [
                    changeIcon(checked: _allCheck),
                    const SizedBox(width: 5),
                    const Text(
                      "전체 동의하기",
                      style: TextStyle(
                          fontSize: 25,
                          height: 1.1,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            //지구 이용약관
            InkWell(
              onTap: () {
                setState(() {
                  _check1 = !_check1;
                });
              },
              child: SizedBox(
                width: 190,
                child: Row(
                  children: [
                    changeIcon(checked: _check1),
                    const SizedBox(width: 5),
                    const Text(
                      "지구 이용약관",
                      style: TextStyle(fontSize: 23, height: 1.1),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            //개인정보 수집 및 이용
            InkWell(
              onTap: () {
                setState(() {
                  _check2 = !_check2;
                });
              },
              child: SizedBox(
                width: 270,
                child: Row(
                  children: [
                    changeIcon(checked: _check2),
                    const SizedBox(width: 5),
                    const Text(
                      "개인정보 수집 및 이용",
                      style: TextStyle(fontSize: 23, height: 1.1),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(), //남는 공간 차지 - 버튼을 아래로 보냄
            //다음 버튼
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const LoginSignupScreen()),
                  child: const Text(
                    "다 음",
                    style: TextStyle(fontSize: 24),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
