import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubarber_app/src/classes/barber.dart';
import 'package:ubarber_app/src/components/avatar.dart';
import 'package:ubarber_app/src/components/logo-letter.dart';
import 'package:ubarber_app/src/components/menu-bottom.dart';

import '../classes/users.dart';

class TelaProfile extends StatelessWidget {
  final User usuario;
  final int ctx;


  TelaProfile({super.key, required this.usuario, required this.ctx});

  _profileContent(_ctx, usuario) {
    switch (_ctx) {
      case 0:
        return clientContent(usuario);
      case 1:
        return barberContent();
    }
  }

  Container barberContent() {
    Barbearia barbearia = Barbearia(
      local: 'Avenida Getulio Vargas, nº132\n Triunfo-PE ',
      horarioFuncionamento: "segunda à sexta",
      servicos: "serviço 1 \nserviço2 \nserviço3",
      contato: "87 9 98196922",);

    return Container(
      child: Column(children: [
        Container(
          width: 315,
          height: 60,
          padding: EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.pin_drop_outlined,size: 32,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              Text(barbearia.local, style: TextStyle(fontSize: 18,),),
            ],
          ),
        ),
        Container(
          width: 315,
          height: 80,
          color: Colors.green,
          child: Text(barbearia.horarioFuncionamento),
        ),
        Container(
          width: 315,
          height: 200,
          color: Colors.blue,
          child: Text(barbearia.servicos),
        ),
        Container(
          width: 315,
          height: 100,
          color: Colors.amber,
          child: Text(barbearia.contato),
        ),
      ]),
    );
  }

  Container clientContent(User usuario) => Container(
        child: Column(children: [
          Text(
            "Atividade",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: 315,
            height: 400,
            color: Colors.amber,
          )
        ]),
      );

  @override
  Widget build(BuildContext context) => _build();

  Widget _build() {
    Container _content = _profileContent(ctx, usuario);
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Avatar(
              username: "Cafezinho",
              url:
                  'https://imagens.ne10.uol.com.br/veiculos/_midias/jpg/2020/08/12/italo_sena-16507268.jpeg'),
          Padding(padding: EdgeInsets.only(top: 10)),
          //TODO: cliente ou barbearia
          _content,
          Padding(padding: EdgeInsets.only(top: 30)),
          MenuBottom(
            icon1: Icon(Icons.arrow_back),
            icon2: Icon(Icons.search),
            icon3: Icon(Icons.border_color_outlined),
          ),
        ]),
      ),
    );
  }
}
