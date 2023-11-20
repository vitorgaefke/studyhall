import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studyhall/auth/login_or_register.dart';
import 'package:studyhall/pages/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // se o usuário estiver logado
          if (snapshot.hasData) {
            return const HomePage();
          }
          // se o usuário não estiver logado
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}