import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

@JsonSerializable()
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

  factory User.fromMap(Map<String, dynamic> map) {
    final User user = User(
        id: map['id'],
        username: map['username'],
        senha: map['senha'],
        urlAvatar: map['url_avatar'],
        status: map['status']);

    return user;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'id: ${id}, username: ${username}, urlAvatar: ${urlAvatar}';
  }
}
