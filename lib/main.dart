import 'package:flutter/material.dart';
import 'package:projeto_perguntas/src/questao.dart';
import 'package:projeto_perguntas/src/responsta.dart';
import 'package:projeto_perguntas/src/resultado.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _perguntaSelecionada = 0;
  int _pontuacao = 0;

  final _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {
          'texto': 'Azul',
          'valor': 10
        },
        {
          'texto': 'Vermelho',
          'valor': 10
        },
        {
          'texto': 'Preto',
          'valor': 5
        },
        {
          'texto': 'Verde',
          'valor': 15
        }
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {
          'texto': 'Gato',
          'valor': 10
        },
        {
          'texto': 'Cachorro',
          'valor': 10
        },
        {
          'texto': 'Leão',
          'valor': 5
        },
        {
          'texto': 'Elefante',
          'valor': 15
        }
      ]
    },
    {
      'texto': 'Qual é o seu instrumento favorito?',
      'respostas': [
        {
          'texto': 'Bateria',
          'valor': 10
        },
        {
          'texto': 'Baixo',
          'valor': 10
        },
        {
          'texto': 'Guitarra',
          'valor': 5
        },
        {
          'texto': 'Violão',
          'valor': 15
        }
      ]
    }
  ];

  void _responder(int pontos) {
    print('Pontuação: $_pontuacao');
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacao += pontos;
      });
      print('Pergunta respondida');
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String,Object>> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text('Perguntas App'),
      ),
      body: temPerguntaSelecionada ? Column(
        children: <Widget>[
          QuestaoPage(_perguntas[_perguntaSelecionada]['texto']),
          ...respostas.map((text) => RespostaComponent(text['texto'], () { _responder(text['valor']); })).toList()
        ],
      ) : ResultadoComponent(_pontuacao),
    );
  }
}
