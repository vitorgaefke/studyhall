import 'package:cloud_firestore/cloud_firestore.dart';

class GaleriaPost {
  final String id;
  final String userId;
  final String userName;
  final String text;
  final String imageUrl;
  final DateTime timestamp;

  GaleriaPost({
    required this.id,
    required this.userId,
    required this.userName,
    required this.text,
    required this.imageUrl,
    required this.timestamp,
  });

  GaleriaPost copyWith({String? imageUrl}) {
    return GaleriaPost(
      id: id,
      userId: userId,
      userName: userName,
      text: text,
      imageUrl: imageUrl ?? this.imageUrl,
      timestamp: timestamp,
    );
  }

  // post para json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'text': text,
      'imageUrl': imageUrl,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }

  // json para post
  factory GaleriaPost.fromJson(Map<String, dynamic> json) {
    return GaleriaPost(
      id: json['id'],
      userId: json['userId'],
      userName: json['userName'],
      text: json['text'],
      imageUrl: json['imageUrl'],
      timestamp: (json['timestamp'] as Timestamp).toDate(),
    );
  }
}