import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/screen/login/check_validate.dart';
import 'package:jigu/screen/login/login_signup2_screen.dart';
//Form 설명
//https://blog.codefactory.ai/flutter/form/

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  //노드 설정
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _passwordCompareFocus = FocusNode();
  //폼 사용을 위한 글로벌 키 설정
  final formKey = GlobalKey<FormState>();
  //비밀번호 비교를 위한 컨트롤러 설정
  final _passwordController = TextEditingController();
  //값 저장을 위한 설정
  String phone = "";
  String email = "";
  String password1 = "";
  String password2 = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //키보드 내리기
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text("회원가입 화면")),
        body: SafeArea(
            //TextFormField 이용을 위한 설정
            child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.all(25),
            //https://steemit.com/kr/@anpigon/flutter
            //다음 버튼 아래로 고정시키는 설정
            //Column, Expanded, SingleChildScrollView, Column
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //휴대전화번호 인증
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 75,
                                child: _phoneInput(),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                height: 48,
                                width: 70,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("인증"),
                                ))
                          ],
                        ),
                        //인증번호 4자리 입력
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Expanded(
                              child: SizedBox(
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "인증번호 숫자 4자리",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                height: 48,
                                width: 70,
                                child: ElevatedButton(
                                    onPressed: () {}, child: const Text("확인")))
                          ],
                        ),
                        const SizedBox(height: 25),
                        //이메일 주소 인증
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 75,
                                child: _emailInput(),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                height: 48,
                                width: 70,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("인증"),
                                ))
                          ],
                        ),
                        const SizedBox(height: 15),
                        //인증번호 6자리 입력
                        Row(
                          children: [
                            const Expanded(
                              child: SizedBox(
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "인증번호 숫자 6자리",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                height: 48,
                                width: 70,
                                child: ElevatedButton(
                                    onPressed: () {}, child: const Text("확인")))
                          ],
                        ),
                        const SizedBox(height: 25),
                        //계정 설정
                        Row(
                          children: [
                            const Expanded(
                              child: SizedBox(
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "계정 설정",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                height: 48,
                                width: 90,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("중복확인")))
                          ],
                        ),
                        const SizedBox(height: 25),
                        //비밀번호 설정
                        SizedBox(
                          height: 75,
                          child: _passwordInput(),
                        ),
                        const SizedBox(height: 15),
                        //비밀번호 확인
                        SizedBox(
                          height: 75,
                          child: _passwordCompare(),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
                //다음화면 넘어가기 위한 임의의 버튼
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => const LoginSignup2Screen());
                    },
                    child: const Text("샘플버튼")),
              ],
            ),
          ),
        )),
        //다음 버튼 화면 아래 고정
        persistentFooterButtons: [
          Container(
            height: 68,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                //올바르게 다 입력했는지 검사
                onPressed: () {
                  formKey.currentState!.validate();
                },
                child: const Text(
                  "다 음",
                  style: TextStyle(fontSize: 23),
                )),
          )
        ],
      ),
    );
  }

  //TextFormField 설정
  InputDecoration _textFormDecoration(hintText, helperText) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      border: const OutlineInputBorder(),
      hintText: hintText,
      helperText: helperText,
    );
  }

  Widget _phoneInput() {
    return TextFormField(
      //형식 자동 감지
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.phone,
      focusNode: _phoneFocus,
      decoration: _textFormDecoration("휴대전화번호", "휴대전화번호를 입력해주세요."),
      validator: (value) => CheckValidate().validatePhone(_phoneFocus, value!),
    );
  }

  //이메일 입력
  Widget _emailInput() {
    return TextFormField(
      //형식 자동 감지
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      focusNode: _emailFocus,
      decoration: _textFormDecoration("이메일", "이메일을 입력해주세요."),
      validator: (value) => CheckValidate().validateEmail(_emailFocus, value!),
    );
  }

  //비밀번호 입력
  Widget _passwordInput() {
    return TextFormField(
        //형식 자동 감지
        autovalidateMode: AutovalidateMode.onUserInteraction,
        //자동완성기능, 자동제안기능 끄기
        autocorrect: false,
        enableSuggestions: false,
        //글자안보이게 보안설정
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        focusNode: _passwordFocus,
        decoration:
            _textFormDecoration("비밀번호 설정", "특수문자, 대소문자, 숫자 포함 8자 이상 입력하세요."),
        controller: _passwordController,
        onSaved: (newValue) {
          setState(() {
            password1 = newValue!;
            print(password1);
          });
        },
        validator: (value) =>
            CheckValidate().validatePassword(_passwordFocus, value!));
  }

  //비밀번호 다시 입력
  Widget _passwordCompare() {
    return TextFormField(
        //형식 자동 감지
        autovalidateMode: AutovalidateMode.onUserInteraction,
        //자동완성기능, 자동제안기능 끄기
        autocorrect: false,
        enableSuggestions: false,
        //글자안보이게 보안설정
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        focusNode: _passwordCompareFocus,
        decoration: _textFormDecoration("비밀번호 확인", "비밀번호를 한번더 입력해주세요."),
        validator: (value) => CheckValidate().comeparePassword(
            _passwordCompareFocus, _passwordController.text, value!));
  }
}
