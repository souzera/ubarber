import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubarber_app/src/modules/barbearias/barber.dart';
import 'package:ubarber_app/src/components/fade.dart';
import 'package:ubarber_app/src/components/logo-letter.dart';
import 'package:ubarber_app/src/components/menu-bottom.dart';
import 'package:ubarber_app/src/components/text-field.dart';
import 'package:ubarber_app/src/components/tile-list.dart';
import 'package:ubarber_app/src/styles/icons.dart';

class TelaLista extends StatelessWidget {
  final List<InfoMockup> items;

  const TelaLista({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    List<InfoMockup> _items = items;
    

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          LogoLetter(),
          Container(
              width: 315,
              child: MyTextField(
                  placeholder: "Pesquisa TODO: campo especifico",
                  obscureText: false)),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          ListTiles(items: items),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          MenuBottom(
            icon1: Icon(Icons.arrow_back),
            icon2: Icon(Icons.person_outline),
            icon3: Icon(Icons.star_outline),
          ),
        ],
      ),
    );
  }
}
