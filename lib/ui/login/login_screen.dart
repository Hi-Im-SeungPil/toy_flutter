import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toy_flutter/main.dart';
import 'package:toy_flutter/manager/shared_preference_manager.dart';
import 'package:toy_flutter/strings.dart';
import 'dart:developer' as developer;

const String LOG_TAG = "loginScreen";

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
        developer.log("회원가입 완료", name: LOG_TAG);
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
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: "마이 홈 페이지")));
          developer.log("로그인 완료", name: LOG_TAG);
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final holder = LoginScreenHolder();

  void _signUpClickListener() {
    BuildContext a = context;
    setState(() {
      holder.signUpClickListener();
    });
  }

  void _loginClickListener() {
    setState(() {
      holder.loginClickListener(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(Strings.loginScreenTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: Strings.loginScreenIdHint,
                ),
                controller: holder.idTextController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: Strings.loginScreenPwdHint,
                ),
                controller: holder.pwdTextController,
                obscureText: true,
              ),
            ),
            TextButton(
                onPressed: _loginClickListener,
                child: Text(holder.loginButtonText)),
            Visibility(
                visible: !holder.isSignUp,
                child: TextButton(
                    onPressed: _signUpClickListener, child: Text("회원가입")))
          ],
        ),
      ),
    );
  }
}
