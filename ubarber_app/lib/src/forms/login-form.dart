import 'package:flutter/material.dart';
import 'package:ubarber_app/src/modules/usuario/users.dart';
import 'package:ubarber_app/src/components/btn-black.dart';
import 'package:ubarber_app/src/components/text-field.dart';
import 'package:ubarber_app/src/components/ub-checkbox.dart';
import 'package:ubarber_app/src/util/const.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  User _user = User(username: "", senha: "", status: false, id: 1, urlAvatar: '');

  bool _validarUser() {
    if (_user.username == 'matheus' && _user.senha == 'senha') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: 'usuário'),
          onSaved: (value) => _user.username = value!,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'senha'),
          onSaved: (newValue) => _user.senha = newValue!,
        ),
        CheckboxUB(
          title: "Manter-se conectado",
        ),
        ButtonBlack(
          title: 'Login',
          method: LOGIN),
      ],
    ));
  }
}
