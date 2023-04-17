// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ubarber_app/src/modules/usuario/users.dart';

import '../modules/usuario/get-user.dart';

class TelaTestes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TesteState();
}

class _TesteState extends State<TelaTestes> {
  late Future<User> futureUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () => {
                  Get.toNamed('/login')
                }, child: Text('Login', style: TextStyle(fontSize: 32),)),
                TextButton(onPressed: () => {
                  Get.toNamed('/cadastro')
                }, child: Text('Cadastro Cliente', style: TextStyle(fontSize: 32),)),
                TextButton(onPressed: () => {
                  Get.toNamed('/barbearias')
                }, child: Text('Barbearias', style: TextStyle(fontSize: 32),)),
              ],
            )
          )
        );
  }
}
