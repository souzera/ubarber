import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ubarber_app/src/modules/clientes/client.dart';
import 'package:ubarber_app/src/modules/usuario/users.dart';

import 'package:ubarber_app/src/util/const.dart';

Future<Map> getClientes() async {
  var url = Uri.parse('${URL_API}/clientes');
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  return json;
}

Future<Cliente> getCliente(username) async {
  print('${URL_API}/client-user/${username}');
  var response =
      await http.get(Uri.parse('${URL_API}/client-user/${username}'));
  var json = jsonDecode(utf8.decode(response.bodyBytes));
  Cliente _cliente = Cliente(
      id: json[0]['id'],
      user: User.fromJson(json[0]['user']),
      nome: json[0]['nome'],
      telefone: json[0]['telefone'],
      status: json[0]['status']);
  return _cliente;
}
