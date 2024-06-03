import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studyhall/components/text_field.dart';
import 'package:studyhall/components/posts.dart';
import 'package:studyhall/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//usuário logado
final currentUser = FirebaseAuth.instance.currentUser!;

//controller text
final textController = TextEditingController();

// deslogar usuario
void signOut() {
  FirebaseAuth.instance.signOut();
  }

//msgpost
void postMessage() {
  if (textController.text.isNotEmpty) {
    FirebaseFirestore.instance.collection("posts").add({
      "Usuario": currentUser.email,
      "Mensagem": textController.text,
      "TimeStamp": Timestamp.now(),
    });
  }

  //limpar textfield
  setState(() {
    textController.clear();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Study Hall'),
        backgroundColor: Colors.yellow[700],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
            icon: const Icon(Icons.person),
          ),],
      ),
      body: Center(
        child: Column(
          children: [
            //posts
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("posts")
                    .orderBy(
                      "TimeStamp",
                      descending: false,
                    )
                  .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final post = snapshot.data!.docs[index];
                        return ShPosts(
                          mensagem: post["Mensagem"],
                          user: post["Usuario"],
                          );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Erro:${snapshot.error}' ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            //barra post
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  //textfield post
                  Expanded(
                    child: MyTextField(controller: textController,
                    hintText: 'Contribua com a comunidade!',
                    obscureText: false),
                  ),
            
                  //botao post
                  IconButton(
                    onPressed: postMessage,
                    icon: const Icon(Icons.send),
                    color: Colors.yellow[700],
                  ),

                  //botao anexar
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.attach_file),
                    color: Colors.yellow[700],
                  ),
                ],
              ),
            ),
      
            //logado como
            Text("Logado como: ${currentUser.email!}",
            style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}