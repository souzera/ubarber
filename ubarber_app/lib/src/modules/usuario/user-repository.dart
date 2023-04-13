import 'package:ubarber_app/src/modules/usuario/users.dart';

abstract class IUserRepository {
  Future<List<User>> findAll();
  Future<User> findUserByUsername(username);
}
