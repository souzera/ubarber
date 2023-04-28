// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';

import 'package:ubarber_app/src/modules/clientes/get-cliente.dart';
import 'package:ubarber_app/src/pages/base/__________profile.dart';
import 'package:ubarber_app/src/pages/profile-cliente.dart';

import '../modules/clientes/client.dart';
import '../modules/usuario/users.dart';

class MenuBottom extends StatelessWidget {
  final Icon icon1;
  final Icon icon2;
  final Icon icon3;

  MenuBottom({
    Key? key,
    required this.icon1,
    required this.icon2,
    required this.icon3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 1100,
      height: 100,
      color: Color.fromARGB(100, 220, 220, 220),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: icon1,
          highlightColor: Colors.blueGrey,
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: icon2,
        ),
        IconButton(
          onPressed: () {
            print('clicou botao 3');
          },
          icon: icon3,
        )
      ]),
    );
  }
}
