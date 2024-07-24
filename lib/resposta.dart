import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelect;

  const Resposta(this.texto, this.onSelect, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Define a cor do botão
          foregroundColor: Colors.black, // Define a cor do texto
        ),
        onPressed: onSelect,
        child: Text(texto), // Mover child para o final
      ),
    );
  }
}
