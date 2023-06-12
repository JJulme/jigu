import 'package:flutter/material.dart';
//https://gloria94.tistory.com/22

class CheckValidatePassword {
  dynamic validatePassword(FocusNode focusNode, String value1) {
    if (value1.isEmpty) {
      focusNode.requestFocus();
      return "비밀번호를 설정해 주세요";
    } else {
      String pattern =
          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value1)) {
        focusNode.requestFocus();
        return "특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.";
      } else {
        return null;
      }
    }
  }

  dynamic comeparePassword(FocusNode focusNode, String value1, String value2) {
    if (value2.isEmpty) {
      focusNode.requestFocus();
      return "비밀번호를 한번더 입력해주세요";
    } else if (value1 == value2) {
      print("비밀번호가 일치합니다.");
      return null;
    } else {
      print(value1);
      print(value2);
      return "비밀번호가 일치하지 않습니다.";
    }
  }
}
