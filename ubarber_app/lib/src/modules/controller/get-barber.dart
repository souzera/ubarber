import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:ubarber_app/src/util/const.dart';

Future<Map> getBarbearias() async{
  var url = Uri.parse('${URL_API}/barbearias');
  var response = await http.get(url);

  var json = jsonDecode(response.body);

  return json;
}