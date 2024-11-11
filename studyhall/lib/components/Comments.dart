import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  void Function()? onTap;
  Comment({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.comment,
        color: Colors.grey,
      ),
    );
  }
}