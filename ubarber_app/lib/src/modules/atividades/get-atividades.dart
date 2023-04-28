import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:ubarber_app/src/util/const.dart';

import 'atividade.dart';

Future<Map> getAtividades() async {
  var url = Uri.parse('${URL_API}/atividades');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception("falha ao tentar consultar");
  }
}

Future<List> getByUser(id) async {
  var url = Uri.parse('${URL_API}/historico-cliente/${id}');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print('atividades');
    print(jsonDecode(utf8.decode(response.bodyBytes)));
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception("falha ao tentar consultar");
  }
}
