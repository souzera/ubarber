import 'dart:convert';

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
