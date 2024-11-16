import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:studyhall/components/itens_filtro.dart';

class BotaoFiltro extends StatelessWidget {
  const BotaoFiltro({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
        context: context,
        bodyBuilder: (context) => const ItensFila(),
        width: 250,
        height: 300,
        direction: PopoverDirection.top,
        ),
      child: SizedBox(
        height: 50,
        width: 50,
        child: Icon(
          Icons.filter_alt_outlined,
          color: Colors.yellow[700],
        ),
      ),
    );
  }
}