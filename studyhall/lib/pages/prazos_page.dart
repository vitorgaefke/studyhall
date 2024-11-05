import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studyhall/pages/criar_prazos_page.dart';

class TelaEventos extends StatefulWidget {
  const TelaEventos({super.key});

  @override
  State<TelaEventos> createState() => _TelaEventos();
}

class _TelaEventos extends State<TelaEventos> {

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Row(
          children: [
            Text(_selectedDate != null
            ? _selectedDate!.toIso8601String().substring(0,10)
            : "Todos os prazos"),
            if (_selectedDate != null)
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _selectedDate = null;
                  });
                },
              ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: _selectedDate ?? DateTime.now(),
                firstDate: DateTime(2021),
                lastDate: DateTime(2028),
              );
              if (newDate != null) {
                setState(() {
                  _selectedDate = newDate;
                });
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CriarPrazosPage()));
        },
        child: Icon(Icons.add), backgroundColor: Colors.yellow[700],
      ),
    );
  }
}