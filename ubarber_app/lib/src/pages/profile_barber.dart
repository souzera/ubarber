// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ubarber_app/src/components/avatar.dart';
import 'package:ubarber_app/src/modules/barbearias/barber-getxcontroller.dart';
import 'package:ubarber_app/src/modules/barbearias/barber.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/menu-bottom.dart';

class ProfileBarber extends StatelessWidget {
  late Barbearia barbearia;

  ProfileBarber({
    required this.barbearia,
  });

  void openURL() async {
    var url = 'https://wa.me/${barbearia.whatsapp}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('num foi');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Avatar(
                username: barbearia.nome,
                url: barbearia.user.urlAvatar,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.place_outlined,
                    size: 38,
                  ),
                ),
                Container(
                  width: 200,
                  child: Text(
                    barbearia.local,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
              Container(
                alignment: Alignment.center,
                width: 315,
                height: 60,
                child: Text(
                  barbearia.horarios,
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Text("- Corte Simples - BR 15.00\n- Corte Degradê - BR 17.00 \n- Corte Degradê 0 - BR 20.00\n- Cabelo e Barba - BR 20.00\n- Desenho Barba - BR 15.00",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16)),
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
                      Icon(Icons.whatsapp, size: 32),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        child: Text(
                          barbearia.whatsapp,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
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
                      onPressed: () => openURL(),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 18),
                            child: Text(
                              "Enviar Mensagem",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      )),
                ]),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              MenuBottom(
                icon1: Icon(Icons.arrow_back),
                icon2: Icon(Icons.search),
                icon3: Icon(Icons.draw_outlined), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
