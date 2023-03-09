import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1100,
      height: 100,
      color: Color.fromARGB(100, 220, 220, 220),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        OutlinedButton(
            onPressed: () {
              print('clicou botao 1');
            },
            child: Text('Voltar')),
        OutlinedButton(
            onPressed: () {
              print('clicou botao 2');
            },
            child: Text('Buscar')),
        OutlinedButton(
            onPressed: () {
              print('clicou botao 3');
            },
            child: Text('Favoritos')),
      ]),
    );
  }
}
