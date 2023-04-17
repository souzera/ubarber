import 'package:ubarber_app/src/modules/classes/client.dart';

abstract class IClientRepository {
  Future<List<Cliente>> findAll();
  Future<Cliente> findUnique();
}
