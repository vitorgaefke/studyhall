import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CriarPrazosPage extends StatefulWidget {
  const CriarPrazosPage({super.key});

  @override
  State<CriarPrazosPage> createState() => _CriarPrazosPageState();
}

class _CriarPrazosPageState extends State<CriarPrazosPage> {
  
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    dateController.text = _selectedDate?.toIso8601String().substring(0,10) ?? "Selecionar data";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text("Adicionar Prazo"),),
      body: Column(
        children: [],
      ),
    );
  }
}