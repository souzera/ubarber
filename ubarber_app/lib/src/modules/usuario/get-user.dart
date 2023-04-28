import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ubarber_app/src/modules/usuario/users.dart';
import 'package:ubarber_app/src/util/const.dart';

Future<List> getUsuarios() async {
  var url = Uri.parse('${URL_API}/usuarios');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception("falha ao tentar consultar");
  }
}

Future<User> getByUsername(username) async {
  var url = Uri.parse('${URL_API}/user-name/${username}');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('falha ao tentar consultar');
  }
}


