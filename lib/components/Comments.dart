import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  final String text;
  final String user;
  final String time;
  const Comments({
    super.key,
    required this.text,
    required this.user,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(text),

          const SizedBox(height: 5),

          Row(
            children: [
              Text(
                user,
                style: TextStyle(color: Colors.grey[700]),
              ),
              Text(" - "),
              Text(time),
            ],
          )
        ],
      ),
    );
  }
}