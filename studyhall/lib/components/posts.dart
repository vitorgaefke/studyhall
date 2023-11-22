import 'package:flutter/material.dart';

class ShPosts extends StatelessWidget {
  final String mensagem;
  final String user;
  const ShPosts({
    super.key,
    required this.mensagem,
    required this.user,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[300]),
            padding: EdgeInsets.all(10),
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user,
                style: TextStyle(color: Colors.grey[700]),
                ),
              const SizedBox(height: 10),
              Text(mensagem),
            ],
          )
        ],
      ),
    );
  }
}