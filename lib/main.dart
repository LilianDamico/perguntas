import 'package:flutter/material.dart';

import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Verde', 'pontuacao': 9},
        {'texto': 'Rosa', 'pontuacao': 8},
        {'texto': 'Lilás', 'pontuacao': 8},
        {'texto': 'Vermelho', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Cavalo', 'pontuacao': 10},
        {'texto': 'Golfinho', 'pontuacao': 10},
        {'texto': 'Coruja', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual sua pedra preferida?',
      'respostas': [
        {'texto': 'Diamante', 'pontuacao': 10},
        {'texto': 'Rubi', 'pontuacao': 10},
        {'texto': 'Safira', 'pontuacao': 10},
        {'texto': 'Esmeralda', 'pontuacao': 9},
        {'texto': 'Topázio', 'pontuacao': 7},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
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
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
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
