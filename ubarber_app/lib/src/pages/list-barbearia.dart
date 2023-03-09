import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubarber_app/src/components/logo-letter.dart';
import 'package:ubarber_app/src/components/menu-bottom.dart';
import 'package:ubarber_app/src/components/text-field.dart';
import 'package:ubarber_app/src/components/tile-empresa.dart';
import 'package:ubarber_app/src/styles/icons.dart';

class TelaLista extends StatelessWidget {
  final List<InfoMockupEmp> items;

  const TelaLista({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    List<InfoMockupEmp> _items = items;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          LogoLetter(),
          Container(
            width: 315,
            child: MyTextField(placeholder: "Pesquisa TODO: campo especifico", obscureText: false)),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          ListEmpresa(items: _items),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          MenuBottom(),
        ],
      ),
    );
  }
}
