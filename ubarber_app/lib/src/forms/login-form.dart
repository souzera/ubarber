import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubarber_app/main.dart';
import 'package:ubarber_app/src/pages/list-barbearias.dart';
import 'package:ubarber_app/src/pages/profile-cliente.dart';
import 'package:ubarber_app/src/util/button-style.dart';
import 'package:ubarber_app/src/modules/usuario/users.dart';
import 'package:ubarber_app/src/components/base/______btn-black.dart';
import 'package:ubarber_app/src/components/text-field.dart';
import 'package:ubarber_app/src/components/ub-checkbox.dart';
import 'package:ubarber_app/src/util/const.dart';

import 'package:http/http.dart' as http;

import '../modules/clientes/client.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controllerUsername,
          keyboardType: TextInputType.emailAddress,
          validator: (String? value) {
            if (value!.length < 3) {
              return 'usuario deve ter no mínimo 3 caracteres';
            } else if (value == null || value.isEmpty) {
              return 'informe um usuário';
            }
          },
          decoration: InputDecoration(labelText: 'usuário'),
        ),
        TextFormField(
          keyboardType: TextInputType.visiblePassword,
          controller: _controllerSenha,
          obscureText: true,
          decoration: InputDecoration(labelText: 'senha'),
        ),
        CheckboxUB(
          title: "Manter-se conectado",
        ),
        Padding(padding: EdgeInsets.only(top: 50)),
        ElevatedButton(
            style: styleBlack(),
            onPressed: () => login(_controllerUsername.text),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )
              ],
            )),
      ],
    ));
  }

  Future<bool> login(_username) async {
    //var url = Uri.parse('${URL_API}/client-user/${_username}');
    //var response = await http.get(url);

    var response =
        await http.get(Uri.parse('${URL_API}/user-name/${_username}'));
    print('response body:');
    User usuario = User.fromMap(jsonDecode(utf8.decode(response.bodyBytes)));
    print(jsonDecode(utf8.decode(response.bodyBytes)));

    //Cliente cliente = Cliente.fromMap(jsonDecode(utf8.decode(response.bodyBytes)));
    //User usuario = cliente.user;
    if (response.statusCode == 200) {
      if (usuario.senha == _controllerSenha.text) {
        print('entrou');
        Get.addPages([
          GetPage(
              name: '/dashboard', page: () => ListBarbearias(usuario: usuario)),
        ]);
        Get.to(ListBarbearias(usuario: usuario));
        return true;
      } else if (usuario.senha != _controllerSenha.text) {
        print('senha incorreta');
        Get.toNamed('/login');
      }
      return false;
    } else {
      throw Exception("falha ao tentar consultar");
    }
  }
}
