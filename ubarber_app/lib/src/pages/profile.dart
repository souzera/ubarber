import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubarber_app/src/modules/classes/barber.dart';
import 'package:ubarber_app/src/components/avatar.dart';
import 'package:ubarber_app/src/components/historico.dart';
import 'package:ubarber_app/src/components/logo-letter.dart';
import 'package:ubarber_app/src/components/menu-bottom.dart';
import 'package:ubarber_app/src/components/tile-list.dart';
import 'package:url_launcher/url_launcher.dart';

import '../modules/usuario/users.dart';

class TelaProfile extends StatelessWidget {
  //final User usuario;
  final int ctx;

  TelaProfile({super.key, required this.ctx});

  _profileContent(_ctx) {
    switch (_ctx) {
      case 0:
        return clientContent({});
      case 1:
        //tentar fazer a consulta utilizando o id
        return barberContent();
    }
  }

  void openURL(whatsapp) async {
    //const url 'https://wa.me/${whatsapp}';= 
    const url = 'https://wa.me/558798196922';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('num foi');
    }
  }

  Container barberContent() {

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
                child: Icon(
                  Icons.place_outlined,
                  size: 38,
                ),
              ),
              Text(
                "barbearia.local",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 315,
          height: 60,
          child: Text(
            "barbearia.horarios",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          width: 315,
          height: 200,
          color: Color.fromRGBO(227, 227, 227, 100),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text('barbearia.servicos',
                textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
          ),
        ),
        Container(
          width: 315,
          height: 120,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.whatsapp,size: 32),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Text(
                  'barbearia.contato',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ), 
                ),
              ],
            ),
            
            Padding(padding: EdgeInsets.only(bottom: 10)),
            MaterialButton(
                color: Color.fromRGBO(227, 227, 227, 100),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                //todo: consulta contato barbearia
                onPressed: () => openURL('558798196922'),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      child: Text(
                        "Enviar Mensagem",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                )),
          ]),
        ),
      ]),
    );
  }

  // ignore: avoid_unnecessary_containers
  Container clientContent(dynamic usuario) => Container(
        child: Column(children: [
          Text(
            "Atividade",
            style: TextStyle(fontSize: 20),
          ),
          Historico(items: List<InfoMockup>.generate(10,((i)=> InfoBTN('Corte $i - Cabelo Simples e Barba', 'Dia 21/0$i/2022')),))
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
            icon3: Icon(Icons.draw_outlined),
          ),
        ]),
      ),
    );
  }
}
