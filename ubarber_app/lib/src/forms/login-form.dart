import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubarber_app/src/modules/usuario/users.dart';
import 'package:ubarber_app/src/components/base/______btn-black.dart';
import 'package:ubarber_app/src/components/text-field.dart';
import 'package:ubarber_app/src/components/ub-checkbox.dart';
import 'package:ubarber_app/src/util/const.dart';

import 'package:http/http.dart' as http;

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
          validator: (value) {
            if (value!.length < 3) {
              return 'usuario deve ter mais que 3 ;caracteres';
            }
            return null;
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
        ElevatedButton(
          
          onPressed: () => login(), 
          child:Row(
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
          )
        ),
        ButtonBlack(title: 'Login', method: LOGIN),
      ],
    ));
  }

  Future<bool> login() async {
    var url = Uri.parse('${URL_API}/logar');
    var response = await http.post(url,
        body: {'username': _controllerUsername, 'password': _controllerSenha});
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    print(json);
    return true;
  }
}
