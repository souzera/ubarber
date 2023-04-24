import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ubarber_app/src/util/const.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class TestesDart extends StatefulWidget {
  const TestesDart({Key? key}) : super(key: key);

  Future<List> pegarUsuarios() async {
    var url = Uri.parse('${URL_API}/usuarios');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('não foi possivel carregar dados');
    }
  }

  @override
  _TestesDartState createState() => _TestesDartState();
}

class _TestesDartState extends State<TestesDart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed:() {
                Get.toNamed('/barbearias');
              }, 
              child: Text('Barbearias', style: TextStyle(fontSize: 32),)),
          ]),
      ),
    );
  }
}
