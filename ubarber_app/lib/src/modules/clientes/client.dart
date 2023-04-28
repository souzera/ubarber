import 'dart:convert';

import '../usuario/users.dart';

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

class Cliente {
  Cliente({
    required this.id,
    required this.user,
    required this.nome,
    required this.telefone,
    required this.status,
  });

  int id;
  User user;
  String nome;
  String telefone;
  bool status;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        user: User.fromJson(json["user"]),
        nome: json["nome"],
        telefone: json["telefone"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "nome": nome,
        "telefone": telefone,
        "status": status,
      };

  factory Cliente.fromMap(Map<String, dynamic> json) {
    final cliente = Cliente(
      id: json["id"],
      user: User.fromMap(json["user"]),
      nome: json["nome"],
      telefone: json["telefone"],
      status: json["status"],
    );

    return cliente;
  }

  @override
  String toString() {
    return 'id: ${id} nome: ${nome} telefone: ${telefone} user: ${user}';
  }
}
