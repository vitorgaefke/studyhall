import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studyhall/components/button.dart';
import 'package:studyhall/components/text_field.dart';
import 'package:studyhall/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // controller de text editing
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  // logar usuário
  void signUserIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailTextController.text,
      password: passwordTextController.text,
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // logo
                Image.asset('assets/claro.jpeg', width: 250, height: 250),

                const SizedBox(height: 50),
          
              //bem vindo
                const Text(
                  'Bem vindo de volta, sentimos sua falta!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 158, 158, 158),
                  ),
                ),
                
                const SizedBox(height: 25),
              //email
              MyTextField(controller: emailTextController, hintText: 'Email', obscureText: false),

              const SizedBox(height: 10),

              //senha
              MyTextField(controller: passwordTextController, hintText: 'Senha', obscureText: true),

              const SizedBox(height: 10),
                  
              //btn entrar
              MyButton(onTap: signUserIn, text: 'Entrar'),

              const SizedBox(height: 25),
              
              //registrar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não tem uma conta?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 158, 158, 158),
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Registrar',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}