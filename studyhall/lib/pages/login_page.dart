import 'package:flutter/material.dart';
import 'package:studyhall/components/button.dart';
import 'package:studyhall/components/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // controller de text editing
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

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
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                
                const SizedBox(height: 50),
          
              //bem vindo
                const Text(
                  'Bem vindo de volta, sentimos sua falta!',
                  style: TextStyle(
                    color: Colors.grey,
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
              MyButton(onTap: () {}, text: 'Entrar'),

              const SizedBox(height: 25),
              
              //registrar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não tem uma conta?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 4),
                  TextButton(
                    onPressed: () {},
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