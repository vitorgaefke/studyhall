import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Evento {
  final String id;
  final String titulo;
  final DateTime dia;

  Evento({
    required this.id,
    required this.titulo,
    required this.dia,
  });

  // lendo os dados do firebase
  factory Evento.fromJson(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Evento(
      id: doc.id,
      titulo: data['Titulo'],
      dia: (data['Dia'] as Timestamp).toDate(),
    );
  }
}