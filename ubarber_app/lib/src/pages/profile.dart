import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubarber_app/src/components/avatar.dart';
import 'package:ubarber_app/src/components/menu-bottom.dart';

import '../classes/users.dart';

class TelaProfile extends StatelessWidget {
  final User usuario;

  TelaProfile({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) => _build();

  Widget _build() => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Avatar(username: "Cafezinho", url: 'https://imagens.ne10.uol.com.br/veiculos/_midias/jpg/2020/08/12/italo_sena-16507268.jpeg'),
          Text("Atividade", style: TextStyle(fontSize: 20),),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            color: Colors.amber,
            width: 315,
            height: 400,
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          MenuBottom(),
        ]
      ),
    ),
  );
}
