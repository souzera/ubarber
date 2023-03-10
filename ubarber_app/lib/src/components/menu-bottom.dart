import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: Icones dinamicos
    return Container(
      width: 1100,
      height: 100,
      color: Color.fromARGB(100, 220, 220, 220),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButton(
            onPressed: () {
              print('clicou botao 1');
            },
            icon: Icon(Icons.arrow_back),
            highlightColor: Colors.blueGrey,
            ),
        IconButton(
            onPressed: () {
              print('clicou botao 2');
            },
            icon: Icon(Icons.person_outlined),),
        IconButton(
            onPressed: () {
              print('clicou botao 3');
            },
            icon: Icon(Icons.star_border_outlined)),
      ]),
    );
  }
}
