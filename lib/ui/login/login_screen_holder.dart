import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../util/manager/shared_preference_manager.dart';
import '../home/home_screen_route.dart';

class LoginScreenHolder {
  final idTextController = TextEditingController();
  final pwdTextController = TextEditingController();
  String loginButtonText = "로그인";
  bool isSignUp = false;

  void loginClickListener(BuildContext context) async {
    if (isSignUp) {
      // 회원가입
      if (idTextController.text.isNotEmpty &&
          pwdTextController.text.isNotEmpty) {
        SharedPreferenceManager.setData("userId", idTextController.text);
        SharedPreferenceManager.setData("userPwd", pwdTextController.text);
        isSignUp = false;
        loginButtonText = "로그인";
      } else {
        Fluttertoast.showToast(msg: "빈 곳 없이 입력해 주세요");
      }
    } else {
      // 로그인
      if (idTextController.text.isNotEmpty &&
          pwdTextController.text.isNotEmpty) {
        Object? userId =
            await SharedPreferenceManager.getData("userId", "String");
        Object? userPwd =
            await SharedPreferenceManager.getData("userPwd", "String");

        if (userId == null || userPwd == null) {
          Fluttertoast.showToast(msg: "회원가입을 먼저 진행해 주세요.");
          return;
        } else {
          userId = userId as String;
          userPwd = userPwd as String;
        }

        if (userId == idTextController.text &&
            userPwd == pwdTextController.text) {
          if (!context.mounted) return;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreenRoute()));
        } else {
          Fluttertoast.showToast(msg: "아이디, 비밀번호가 일치하지 않습니다.");
        }
      } else {
        Fluttertoast.showToast(msg: "빈 곳 없이 입력해 주세요");
      }
    }
  }

  void signUpClickListener() {
    isSignUp = true;
    loginButtonText = "완료";
  }
}
