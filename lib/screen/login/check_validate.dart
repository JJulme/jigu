import 'package:flutter/material.dart';
//https://gloria94.tistory.com/22

class CheckValidate {
  dynamic validatePhone(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return "휴대전화번호를 입력해주세요.";
    } else {
      String pattern = r'^010-?([0-9]{4})-?([0-9]{4})$';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        focusNode.requestFocus();
        return "잘못된 휴대전화번호 형식 입니다";
      } else {
        //인증번호 전송과 전했다는 문구 5분의 시간초 시작
        return null;
      }
    }
  }

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
