import 'package:flutter/material.dart';
import 'package:studyhall/components/button.dart';
import 'package:studyhall/components/text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    // controller de text editing
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

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
                  Icons.person,
                  size: 150,
                ),
                
                const SizedBox(height: 50),
          
              //bem vindo
                const Text(
                  'Insira seus dados e faça parte da comunidade!',
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

              // confirmar senha
              MyTextField(controller: confirmPasswordTextController, hintText: 'Confirme sua senha', obscureText: true),

              const SizedBox(height: 10),
                  
              //btn entrar
              MyButton(onTap: () {}, text: 'Cadastrar'),

              const SizedBox(height: 25),
              
              //login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Já possui uma conta?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Entrar',
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