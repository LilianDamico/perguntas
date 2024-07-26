import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoTotal;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacaoTotal, this.quandoReiniciarQuestionario,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Pontuação Total: $pontuacaoTotal',
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue, // Define a cor do texto
          ),
          child: const Text(
            'Reiniciar',
            style: TextStyle(fontSize: 20), // Define o tamanho da fonte
          ),
        ),
      ],
    );
  }
}
