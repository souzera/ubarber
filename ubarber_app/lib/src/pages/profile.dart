import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubarber_app/src/classes/barber.dart';
import 'package:ubarber_app/src/components/avatar.dart';
import 'package:ubarber_app/src/components/logo-letter.dart';
import 'package:ubarber_app/src/components/menu-bottom.dart';

import '../classes/users.dart';

class TelaProfile extends StatelessWidget {
  //final User usuario;
  final int ctx;


  TelaProfile({super.key, required this.ctx});

  _profileContent(_ctx) {
    switch (_ctx) {
      case 0:
        return clientContent(User(username: 'Cafezinho', password: '123', manter: true));
      case 1:
        //tentar fazer a consulta utilizando o id
        return barberContent();
    }
  }

  Container barberContent() {
    Barbearia barbearia = Barbearia(
      local: 'Avenida Getulio Vargas, nº132\nTriunfo-PE ',
      horarioFuncionamento: "Segunda à Sexta 8h00 às 16h00\nSábado 8h00 às 12h00",
      servicos: "serviço 1 - cabelo simples \nserviço2 - corte militar \nserviço3 - degrade\nserviço 4 - cabelo e barba",
      contato: "87 9 98196922",);

    return Container(
      child: Column(children: [
        Container(
          width: 315,
          height: 62,
          padding: EdgeInsets.only(bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(Icons.place_outlined,size: 38,),),
              Text(barbearia.local,
                textAlign: TextAlign.center, 
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 315,
          height: 60,
          child: Text(barbearia.horarioFuncionamento, textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
        ),
        Container(
          alignment: Alignment.topLeft,
          width: 315,
          height: 200,
          color: Color.fromRGBO(227, 227, 227, 100),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text(barbearia.servicos,
            textAlign: TextAlign.left, 
            style: TextStyle(fontSize: 16)),
          ),
        ),
        Container(
          width: 315,
          height: 120,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(barbearia.contato, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              MaterialButton(
                color: Color.fromRGBO(227, 227, 227, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
                onPressed: () {  
                  print("enviar mensagem");
                },
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      child: Text("Enviar Mensagem", style: TextStyle(fontSize: 18),),
                      ),
                  ],
                )),
          ]
          ),
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
    Container _content = _profileContent(ctx);
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
