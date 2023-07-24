import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/screen/login/login_signup_seller2_screen.dart';

class LoginSignupSellerScreen extends StatefulWidget {
  const LoginSignupSellerScreen({super.key});

  @override
  State<LoginSignupSellerScreen> createState() =>
      _LoginSignupSellerScreenState();
}

class _LoginSignupSellerScreenState extends State<LoginSignupSellerScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //키보드 내리기
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("사업자 가입"),
        ),
        body: SafeArea(
            //TextFormField 이용을 위한 설정
            child: Form(
          child: Container(
            margin: const EdgeInsets.all(25),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        myTextField("사업자등록번호"),
                        const SizedBox(height: 25),
                        myTextField("대표자 성명"),
                        const SizedBox(height: 25),
                        //개업일자 선택은 달력을 띄워서 입력하도록 만들어야 함
                        myTextField("개업일자"),
                        const SizedBox(height: 25),
                        myTextField("법인등록번호"),
                        const SizedBox(height: 25),
                        SizedBox(
                          height: 55,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "중복 확인",
                                style: TextStyle(fontSize: 24),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
        persistentFooterButtons: [
          Container(
            height: 68,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: () => Get.to(() => const LoginSignupSeller2Screen()),
                child: const Text(
                  "다 음",
                  style: TextStyle(fontSize: 23),
                )),
          )
        ],
      ),
    );
  }

  Widget myTextField(String text) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          labelText: text,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
