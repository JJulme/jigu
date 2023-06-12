import 'package:flutter/material.dart';
//https://gloria94.tistory.com/22

class CheckValidateEmail {
  dynamic validateEmail(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return "이메일을 입력해주세요.";
    } else {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        focusNode.requestFocus();
        return "잘못된 이메일 형식입니다";
      } else {
        //인증번호 전송과 전했다는 문구 5분의 시간초 시작
        return null;
      }
    }
  }
}
