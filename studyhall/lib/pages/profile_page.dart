import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studyhall/components/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  //user logado
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('SEU PERFIL!'),
        backgroundColor: Colors.yellow[700],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 50),
          //foto
          const Icon(
            Icons.account_circle,
            size: 75,
            color: Colors.grey,
          ),
          const SizedBox(height: 15),

          //email
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          //detalhes
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Detalhes do usuário',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          //nome
          const MyTextBox(text: 'vitorgaefke', sectionName: 'nome'),
          //bio
          const MyTextBox(text: 'sua bio aqui!', sectionName: 'bio'),
          const SizedBox(height: 30),
          //posts do user
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Suas postagens',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}