// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubarber_app/src/components/base/______btn-black.dart';
import 'package:ubarber_app/src/components/btn-google-primary.dart';
import 'package:ubarber_app/src/components/logo-letter.dart';
import 'package:ubarber_app/src/components/text-field.dart';

import '../util/const.dart';

class FormCadastro extends StatelessWidget {
  FormCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _build()),
    );
  }

  Widget _build() => Container(
        width: 428,
        color: Colors.transparent,
        child: Column(children: [
          Padding(padding: EdgeInsets.only(top: 40)),
          LogoLetter(),
          Container(
            alignment: Alignment.center,
            width: 278,
            height: 480,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //TODO: Refinar pagina
                PrimaryGoogleButton(title: "Continuar com Google"),
                Divider(height: 20),
                Padding(padding: EdgeInsets.only(top: 5)),
                MyTextField(
                  placeholder: "Nome",
                  obscureText: false,
                ),
                MyTextField(
                  placeholder: "Usuário",
                  obscureText: false,
                ),
                MyTextField(
                  placeholder: "Senha",
                  obscureText: true,
                ),
                MyTextField(
                  placeholder: "Confirmar Senha",
                  obscureText: true,
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                ButtonBlack(
                  title: "Cadastra-se",
                  method: CADASTRO,
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                TextButton(
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    child: Text('Já possui conta? Clique aqui.'))
              ],
            ),
          ),
        ]),
      );
}
