import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

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

class User {
    User({
        required this.id,
        required this.username,
        required this.senha,
        required this.urlAvatar,
        required this.status,
    });

    int id;
    String username;
    String senha;
    String urlAvatar;
    bool status;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        senha: json["senha"],
        urlAvatar: json["url_avatar"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "senha": senha,
        "url_avatar": urlAvatar,
        "status": status,
    };
}
