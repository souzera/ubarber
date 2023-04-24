import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ubarber_app/src/modules/barbearias/barber.dart';

import 'package:ubarber_app/src/util/const.dart';

Future<List> getBarbearias() async {
  var url = Uri.parse('${URL_API}/barbearias');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception("falha ao tentar consultar");
  }
}
