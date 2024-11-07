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
    dateController.text =
      _selectedDate?.toIso8601String().substring(0,10) ?? "Selecionar data";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text("Adicionar Prazo")),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: "Título do prazo"
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: dateController,
            readOnly: true,
            onTap: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: _selectedDate != null ? _selectedDate! : DateTime.now(),
                firstDate: DateTime(2021),
                lastDate: DateTime(2028),
              );
              if (newDate != null) {
                setState(() {
                  _selectedDate = newDate;
                  dateController.text = newDate.toIso8601String().substring(0,10);
                });
              }
            },
          ),
          const SizedBox(height: 16),

          FloatingActionButton(
            onPressed: () {
              if (_selectedDate != null) {
                FirebaseFirestore.instance.collection("prazos").add({
                  "Titulo": titleController.text,
                  "Dia": _selectedDate,
                });
                Navigator.pop(context);
              } else {
                print("erro!");
              }
            },
            backgroundColor: Colors.yellow[700],
            child: const Icon(Icons.save),
      ),
          // ElevatedButton(
          //   onPressed: () {
          //     // salvar no banco de dados
          //     if (_selectedDate != null) {
          //       FirebaseFirestore.instance.collection("prazos").add({
          //         "Titulo": titleController.text,
          //         "Dia": _selectedDate,
          //       });
          //       Navigator.pop(context);
          //     } else {
          //       print("erro!");
          //     }
          //   },
          //   child: const Text("Salvar"),
          // ),
        ],
      ),
    );
  }
}