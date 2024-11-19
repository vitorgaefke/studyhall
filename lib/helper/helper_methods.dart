import 'package:cloud_firestore/cloud_firestore.dart';

String formatDate(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();

  // ano
  String ano = dateTime.year.toString();

  //mes
  String mes = dateTime.month.toString();

  //dia
  String dia = dateTime.day.toString();

  //data formatada
  String dataFormatada = "$dia/$mes/$ano";

  return dataFormatada;
}