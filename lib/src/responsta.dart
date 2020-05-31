import 'package:flutter/material.dart';

class RespostaComponent extends StatelessWidget {
  
  final String text;
  final void Function() onSelecao;

  RespostaComponent(this.text, this.onSelecao);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(text),
        textColor: Colors.white,
        color: Colors.blue,
        onPressed: onSelecao,
      ),
    );
  }
}
