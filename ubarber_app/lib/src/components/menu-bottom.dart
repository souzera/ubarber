import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  final Icon icon1;
  final Icon icon2;
  final Icon icon3;

  MenuBottom(
      {super.key,
      required this.icon1,
      required this.icon2,
      required this.icon3});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 1100,
      height: 100,
      color: Color.fromARGB(100, 220, 220, 220),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
        children: [
          IconButton(
                onPressed: () {Navigator.pop(context);
                },
                icon: icon1,
                highlightColor: Colors.blueGrey,
              ),
        IconButton(
          onPressed: () {
            print('clicou botao 2');
          },
          icon: icon2,
        ),
        IconButton(
            onPressed: () {
              print('clicou botao 3');
            },
            icon: icon3,)
      ]),
    );
  }
}
