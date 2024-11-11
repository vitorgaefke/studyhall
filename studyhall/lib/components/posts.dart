import 'package:flutter/material.dart';
import 'package:studyhall/components/Comments.dart';
import 'package:studyhall/components/like_button.dart';

class ShPosts extends StatefulWidget {
  final String mensagem;
  final String user;
  const ShPosts({
    super.key,
    required this.mensagem,
    required this.user,
    });

  @override
  State<ShPosts> createState() => _ShPostsState();
}

class _ShPostsState extends State<ShPosts> {



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
  Container(
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[300]),
    padding: const EdgeInsets.all(10),
    child: const Icon(Icons.person, color: Colors.white), // imagem de perfil
  ),
  const SizedBox(width: 20),
  Expanded( // Adicionado para expandir o espaço disponível para o texto
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.user,
          style: TextStyle(color: Colors.grey[700]),
        ),
        const SizedBox(height: 10),
        Text(
          widget.mensagem,
          style: TextStyle(color: Colors.grey[800]), // Estilo opcional
          softWrap: true, // Permitir quebra de linha
          overflow: TextOverflow.visible,
        ),
      ],
    ),
  ),
  const SizedBox(width: 20),
  LikeButton(
    isLiked: true,
    onTap: () {}
  ),
  const SizedBox(width: 20),
  Comment(
    onTap: () {}
  ),
],

      ),
    );
  }
}