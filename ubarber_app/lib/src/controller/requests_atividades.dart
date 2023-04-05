import 'package:http/http.dart' as http;


Future<http.Response> fetchAll() async {
  return http.get('http://127.0.0.1:5000/usuarios');
}