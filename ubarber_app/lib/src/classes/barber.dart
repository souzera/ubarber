import 'package:ubarber_app/src/classes/users.dart';

class Barbearia extends User{
  final String nome;
  final String local;
  final String horarioFuncionamento;
  final String servicos;
  final String contato;

  Barbearia({required this.nome, 
      required this.local,
      required this.horarioFuncionamento,
      required this.servicos,
      required this.contato}): super(username: "cafezin", password: '123', manter: true);
}
