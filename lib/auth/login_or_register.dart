import 'package:flutter/material.dart';
import 'package:studyhall/pages/login_page.dart';
import 'package:studyhall/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //login first
  bool isLogin = true;

  //mudar login X registro
  void changeLoginOrRegister() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginPage(onTap: changeLoginOrRegister);
    } else {
      return RegisterPage(onTap: changeLoginOrRegister);
    }
  }
}