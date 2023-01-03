import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ubarber_app/src/components/btn-black.dart';
import 'package:ubarber_app/src/components/btn-google-primary.dart';
import 'package:ubarber_app/src/components/divider.dart';
import 'package:ubarber_app/src/components/logo-letter.dart';
import 'package:ubarber_app/src/components/text-field.dart';
import 'package:ubarber_app/src/components/ub-checkbox.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _buildBody()),
    );
  }

  //construindo o layout
  //ref. Flutter Catalog
  Widget _buildBody() => Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        width: 478,
        height: 926,
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 45)),
            LogoLetter(),
            Container(
              alignment: Alignment.center,
              width: 240,
              height: 480,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //TODO: Refinar pagina
                  const PrimaryGoogleButton(title: "Logar com Google"),
                  MyDivider(),
                  Form(
                      child: Column(
                    children: [
                      MyTextField(placeholder: "usuário", obscureText: false),
                      MyTextField(
                        placeholder: 'senha',
                        obscureText: true,
                      ),
                      CheckboxUB(title: "Manter-se conectado")
                    ],
                  )),
                  Text("Esqueceu a senha?"),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  ButtonBlack(),
                  Padding(padding: EdgeInsets.only(top: 3)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Não tem conta?"),
                      TextButton(
                          onPressed: () {
                            print("clicou");
                          },
                          child: Text("Cadastre-se!"))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
