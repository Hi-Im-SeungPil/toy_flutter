import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toy_flutter/strings.dart';

import 'login_screen_holder.dart';


const String LOG_TAG = "loginScreen";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final holder = LoginScreenHolder();

  void _signUpClickListener() {
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
