// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'client.dart';

class ClienteBuilder extends StatelessWidget {
  late Future<Cliente> futureCliente;

  ClienteBuilder({
    Key? key,
    required this.futureCliente,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _build(futureCliente);
  }
}

_build(Future<Cliente> futureCliente) {
  return FutureBuilder(
    future: futureCliente,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.nome);
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }
      return const CircularProgressIndicator();
    },
  );
}
