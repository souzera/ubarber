import 'package:flutter/material.dart';
import 'package:ubarber_app/src/components/btn-black.dart';
import 'package:ubarber_app/src/components/btn-google-primary.dart';
import 'package:ubarber_app/src/components/logo-letter.dart';
import 'package:ubarber_app/src/components/text-field.dart';

class FormCadastro extends StatelessWidget{
  const FormCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _build()),
    );
  }
  
  Widget _build() => Container(
      width: 428,
      color: Colors.transparent,
      child: Column(
        children: [
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
                  MyTextField(
                    placeholder: "Nome",
                    obscureText: false,),
                  MyTextField(
                    placeholder: "Usuário",
                    obscureText: false,),
                  MyTextField(
                    placeholder: "Senha",
                    obscureText: true,),
                  MyTextField(
                    placeholder: "Confirmar Senha", 
                    obscureText: true,),
                  ButtonBlack(
                    title: "Cadastra-se",
                    method: 1,
                  ),
                  Divider(),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  PrimaryGoogleButton(
                    title: "Continuar com Google"),
                ],
              ),
            ),
        ]),
    );
  }