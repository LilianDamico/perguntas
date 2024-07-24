import 'package:flutter/material.dart';

import './questao.dart';
import './resposta.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': ['Azul', 'Verde', 'Rosa', 'Lilás', 'Vermelho'],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': ['Gato', 'Cachorro', 'Cavalo', 'Golfinho', 'Coruja'],
    },
    {
      'texto': 'Qual sua pedra preferida?',
      'respostas': ['Diamante', 'Rubi', 'Safira', 'Esmeralda', 'Topázio'],
    }
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas'] as List<String>
        : [];

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.deepPurple,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelecionada]['texto'] as String),
                  ...respostas
                      .map((resposta) => Resposta(resposta, _responder)),
                ],
              )
            : const Center(
                child: Text(
                  'Parabéns!',
                  style: TextStyle(fontSize: 28),
                ),
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
