import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ubarber_app/src/modules/usuario/users.dart';
import 'package:ubarber_app/src/modules/usuario/user-repository.dart';
import 'package:ubarber_app/src/util/const.dart';

class UserController implements IUserRepository {
  @override
  Future<User> findUserByUsername(username) async {
    final response =
        await http.get(Uri.parse('${URL_API}/user-name/${username}'));
    Map<String, dynamic> json = jsonDecode(response.body);
    return User.fromMap(json);
  }

  @override
  Future<List<User>> findAll() async {
    final response = await http.get(Uri.parse('${URL_API}/usuarios'));
    List<Map<String, dynamic>> json = jsonDecode(response.body);
    return json.map<User>((resp) => User.fromMap(resp)).toList();
  }
}
