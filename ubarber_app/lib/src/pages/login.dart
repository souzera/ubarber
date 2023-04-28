import 'package:flutter/material.dart';
import 'package:ubarber_app/src/forms/login-form.dart';
import 'package:get/get.dart';

import '../components/logo-letter.dart';

class Login extends StatefulWidget {

  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Center(
             child: Container(
              width: 350,
              height: 800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoLetter(),
                  Container(
                    width: 300,
                    child: LoginForm(),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed('/cadastro');
                      },
                      child: Text('Cadastrar-se'))
                ]
              ),
             ),
           ),
       );
  }
}