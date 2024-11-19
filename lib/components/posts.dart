import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studyhall/components/Comments.dart';
import 'package:studyhall/components/comment_button.dart';
import 'package:studyhall/components/like_button.dart';
import 'package:studyhall/helper/helper_methods.dart';

class ShPosts extends StatefulWidget {
  final String mensagem;
  final String user;
  final String postId;
  const ShPosts({
    super.key,
    required this.mensagem,
    required this.user,
    required this.postId,
    });

  @override
  State<ShPosts> createState() => _ShPostsState();
}

class _ShPostsState extends State<ShPosts> {

  final currentUser = FirebaseAuth.instance.currentUser!;

  bool isLiked = false;

  final _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    DocumentReference postRef =
    FirebaseFirestore.instance.collection("posts").doc(widget.postId);
  }

  // toggle do botão de like
  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void addComment(String commentText) {
    // Adicionar comentário
    FirebaseFirestore.instance.collection("posts").doc(widget.postId).collection("comments").add({
      "ComentadoPor": currentUser.email,
      "Comentario": commentText,
      "ComentarioEm": Timestamp.now(),
    });
  }

  void showCommentDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Adicionar comentário"),
        content: TextField(
          controller: _commentController,
          decoration: InputDecoration(
            hintText: "Digite seu comentário",
          ),
        ),
        actions: [
          // postar comentário
          TextButton(
            onPressed: () { addComment(_commentController.text);
            Navigator.pop(context);
            _commentController.clear();
            },
            child: Text("Postar"),
          ),
          // cancelar
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user,
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(height: 10),
              Text(widget.mensagem),
              const SizedBox(height: 10),
              // Container(
              //   decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[300]),
              //   padding: const EdgeInsets.all(10),
              //   child: const Icon(Icons.person, color: Colors.white), // imagem de perfil
              // ),
            ],
          ),

          const SizedBox(width: 20),
          
          //botoes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //like
              Column(
                children: [
                  LikeButton(
                    isLiked: isLiked,
                    onTap: toggleLike,
                  ),

                  const SizedBox(height: 5),
                ],
              ),

          //comentarios
          Column(
            children: [
              //like
              CommentButton(
                onTap: (showCommentDialog),
              ),

              const SizedBox(height: 5),
            ],
          ),
        ],
      ),

      //comentarios
      StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
          .collection("posts")
          .doc(widget.postId)
          .collection("comments")
          .orderBy("ComentarioEm", descending: true)
          .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: snapshot.data!.docs.map((doc) {
              final commentData = doc.data() as Map<String, dynamic>;

              return Comments(
                text: commentData["Comentario"],
                user: commentData["ComentadoPor"],
                time: formatDate(commentData["ComentarioEm"]),
              );
            }).toList(),
          );
        },
      )


          // Expanded( // Adicionado para expandir o espaço disponível para o texto
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         widget.user,
          //         style: TextStyle(color: Colors.grey[700]),
          //       ),
          //       const SizedBox(height: 10),
          //       Text(
          //         widget.mensagem,
          //         style: TextStyle(color: Colors.grey[800]), // Estilo opcional
          //         softWrap: true, // Permitir quebra de linha
          //         overflow: TextOverflow.visible,
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(width: 20),
          // LikeButton(
          //   isLiked: isLiked,
          //   onTap: toggleLike,
          // ),
          // const SizedBox(width: 20),
          // CommentButton(
          //   onTap: (showCommentDialog),
          // ),
    ],
    ),
   );
  }
}