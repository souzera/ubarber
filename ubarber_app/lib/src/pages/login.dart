import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubarber_app/src/components/btn-black.dart';
import 'package:ubarber_app/src/components/btn-google-primary.dart';
import 'package:ubarber_app/src/components/divider.dart';
import 'package:ubarber_app/src/components/logo-letter.dart';
import 'package:ubarber_app/src/components/text-field.dart';
import 'package:ubarber_app/src/components/ub-checkbox.dart';
import 'package:ubarber_app/src/forms/login-form.dart';
import 'package:ubarber_app/src/modules/classes/client.dart';
import 'package:ubarber_app/src/pages/cadastro-cliente.dart';
import 'package:ubarber_app/src/util/const.dart';
import 'package:ubarber_app/src/util/controller.dart';

class LoginPage extends GetView<HttpController> {
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
                  controller.obx((state) => ListView.builder(
                        itemCount: 3,
                        itemBuilder: ((_, index) {
                          final User item = state[index];
                          return ListTile(
                            title: Text(item.username),
                          );
                        })), onError: (error) {
                    return Text(error!);
                  })
                  //TODO: Refinar pagina
                  //const PrimaryGoogleButton(title: "Logar com Google"),
                  //ButtonBlack(method:  LOGIN, title: "login automatico")
                  //MyDivider(),
                  //LoginForm(),
                ],
              ),
            ),
          ],
        ),
      );
}
