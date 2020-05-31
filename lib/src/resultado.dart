import 'package:flutter/material.dart';

class ResultadoComponent extends StatelessWidget {
  final int pontuacao;

  ResultadoComponent(this.pontuacao);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Parabéns! Sua pontuação: $pontuacao',
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
