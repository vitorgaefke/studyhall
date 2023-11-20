import 'package:flutter/material.dart';
import 'package:studyhall/components/text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//usuário nao logado

//controller text
final textController = TextEditingController();

//msgpost
void postMessage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Study Hall'),
        backgroundColor: Colors.yellow[700],
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),],
      ),
      body: Center(
        child: Column(
          children: [
            //app
      
            //post
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  //textfield post
                  Expanded(
                    child: MyTextField(controller: textController,
                    hintText: 'Contribua com a comunidade!',
                    obscureText: false),
                  ),
            
                  //botao post
                  IconButton(
                    onPressed: postMessage,
                    icon: const Icon(Icons.send),
                    color: Colors.yellow[700],
                  ),

                  //botao anexar
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.attach_file),
                    color: Colors.yellow[700],
                  ),
                ],
              ),
            ),
      
            //logado como
            const Text("Logado como: vitorgaefke@gmail.com")
          ],
        ),
      ),
    );
  }
}