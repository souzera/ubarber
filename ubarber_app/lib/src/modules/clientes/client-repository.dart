import 'package:ubarber_app/src/modules/clientes/client.dart';

abstract class IClientRepository {
  Future<List<Cliente>> findAll();
  Future<Cliente> findUnique();
}
