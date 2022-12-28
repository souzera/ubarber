import 'package:flutter/material.dart';
import 'package:ubarber_app/src/components/btn-black.dart';
import 'package:ubarber_app/src/components/btn-google-primary.dart';
import 'package:ubarber_app/src/components/divider.dart';
import 'package:ubarber_app/src/components/logo-letter.dart';

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
      width: 478,
      height: 926,
      color: Colors.transparent,
      child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 115)),
            LogoLetter(),
            Container(
              width: 278,
              height: 420,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //TODO: Refinar pagina
                  const PrimaryGoogleButton(title: "Logar com Google"),
                  MyDivider(),
                  const TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'login',
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'senha',
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text("O Manter-se contectado"),
                  Text("Esqueceu a senha?"),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  ButtonBlack(),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text("Não possui conta? Cadastre-se!"),
                ],
              ),
            ),
          ],
        ),
      );
}
