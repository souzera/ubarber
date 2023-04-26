import 'dart:convert';

import 'package:ubarber_app/src/modules/clientes/client.dart';
import 'package:ubarber_app/src/modules/barbearias/barber.dart';

Atividade atividadeFromJson(String str) => Atividade.fromJson(json.decode(str));

String atividadeToJson(Atividade data) => json.encode(data.toJson());

class Atividade {
    Atividade({
        required this.barbearia,
        required this.cliente,
        required this.dataAtv,
    });

    Barbearia barbearia;
    Cliente cliente;
    DateTime dataAtv;

    factory Atividade.fromJson(Map<String, dynamic> json) => Atividade(
        barbearia: Barbearia.fromJson(json["barbearia"]),
        cliente: Cliente.fromJson(json["cliente"]),
        dataAtv: DateTime.parse(json["data_atv"]),
    );

    Map<String, dynamic> toJson() => {
        "barbearia": barbearia.toJson(),
        "cliente": cliente.toJson(),
        "data_atv": dataAtv.toIso8601String(),
    };
}