import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studyhall/components/posts.dart';

class PaginaPrazos extends StatefulWidget {
  const PaginaPrazos({super.key});

  @override
  State<PaginaPrazos> createState() => _PaginaPrazosState();
}

class _PaginaPrazosState extends State<PaginaPrazos> {

  //usuário logado
final currentUser = FirebaseAuth.instance.currentUser!;

//prazo post
// void novoPrazo() {
//   if (textController.text.isNotEmpty) {
//     FirebaseFirestore.instance.collection("posts").add({
//       "Usuario": currentUser.email,
//       "Mensagem": textController.text,
//       "Materia": textController.value,
//       "TimeStamp": Timestamp.now(),
//     });
//   }
  
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text('DATAS E PRAZOS'),
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
                      descending: true,
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
            //logado como
            Text("Logado como: ${currentUser.email!}",
            style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.yellow[700],
        child: const Icon(Icons.add, color: Colors.white),
      ), 
    );
  }
}