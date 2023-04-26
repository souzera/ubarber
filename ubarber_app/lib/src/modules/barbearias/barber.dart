import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:ubarber_app/src/modules/usuario/users.dart';

Barbearia barbeariaFromJson(String str) => Barbearia.fromJson(json.decode(str));

String barbeariaToJson(Barbearia data) => json.encode(data.toJson());

@JsonSerializable()
class Barbearia {
    Barbearia({
        required this.id,
        required this.nome,
        required this.user,
        required this.whatsapp,
        required this.local,
        required this.horarios,
    });

    int id;
    String nome;
    User user;
    String whatsapp;
    String local;
    String horarios;

    factory Barbearia.fromJson(Map<String, dynamic> json) => Barbearia(
        id: json["id"],
        nome: json["nome"],
        user: User.fromJson(json["user"]),
        whatsapp: json["whatsapp"],
        local: json["local"],
        horarios: json["horarios"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "user": user.toJson(),
        "whatsapp": whatsapp,
        "local": local,
        "horarios": horarios,
    };
}