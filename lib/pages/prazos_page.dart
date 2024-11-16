
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studyhall/pages/criar_prazos_page.dart';
import 'package:studyhall/services/storage/eventos.dart';

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
                icon: const Icon(Icons.close),
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
            icon: const Icon(Icons.calendar_today),
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
      body: StreamBuilder<QuerySnapshot>(
        stream: _selectedDate == null
          ? FirebaseFirestore.instance.collection("prazos").orderBy("Dia", descending: true).snapshots()
          : FirebaseFirestore.instance
            .collection("prazos")
            .where("Dia", isEqualTo: _selectedDate)
            .orderBy("Dia", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Evento> eventos = 
            snapshot.data!.docs.map((e) => Evento.fromJson(e)).toList();
          return ListView.builder(
            itemCount: eventos.length,
            itemBuilder: (context, index) {
              Evento evento = eventos[index];
              return ListTile(
                title: Text(evento.titulo),
                subtitle: Text(evento.dia.toIso8601String().substring(0,10)),
                onTap: () {},
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CriarPrazosPage()));
        }, backgroundColor: Colors.yellow[700],
        child: const Icon(Icons.add),
      ),
    );
  }
}