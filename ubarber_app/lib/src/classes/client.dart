import 'package:ubarber_app/src/classes/users.dart';

class Cliente extends User{
  final String nome;
  final String contato;

  //TODO: vetor de atividade
  final String atividade;

  Cliente({required this.nome, required this.contato, required this.atividade}):super(username: "cafezin", password: '123', manter: true);

}