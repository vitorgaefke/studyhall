import 'package:flutter/material.dart';

class ItensFila extends StatelessWidget {
  const ItensFila({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //materia 1
        Container(
          height: 50,
          color: Colors.yellow[700],
          child: const Center(
            child: Text(
              'Administracao',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),

        //materia 2
        Container(
          height: 50,
          color: Colors.yellow[700],
          child: const Center(
            child: Text(
              'Estrutura de Dados',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),

        //materia 3
        Container(
          height: 50,
          color: Colors.yellow[700],
          child: const Center(
            child: Text(
              'Ética Profissional',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),

        //materia 4
        Container(
          height: 50,
          color: Colors.yellow[700],
          child: const Center(
            child: Text(
              'TG 1',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),

        //materia 5
        Container(
          height: 50,
          color: Colors.yellow[700],
          child: const Center(
            child: Text(
              'TG 2',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),

        //materia 6
        Container(
          height: 50,
          color: Colors.yellow[700],
          child: const Center(
            child: Text(
              'Contabilidade',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),

        // //materia 7
        // Container(
        //   height: 50,
        //   color: Colors.yellow[700],
        //   child: const Center(
        //     child: Text(
        //       'Engenharia 1',
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontWeight: FontWeight.bold,
        //         fontSize: 20,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}