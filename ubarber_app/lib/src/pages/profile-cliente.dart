import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubarber_app/src/components/menu-bottom.dart';
import 'package:ubarber_app/src/modules/atividades/atividade.dart';
import 'package:ubarber_app/src/modules/atividades/get-atividades.dart';
import 'package:ubarber_app/src/pages/list-barbearias.dart';

import '../components/avatar.dart';
import '../modules/clientes/client.dart';

class ProfileCliente extends StatelessWidget {
  late Cliente cliente;

  ProfileCliente({
    super.key,
    required this.cliente,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Avatar(
              username: cliente.nome,
              url: cliente.user.urlAvatar,
            ),
            Container(
              alignment: Alignment.center,
              width: 315,
              height: 60,
              child: Text(
                'Histórico',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
              width: 300,
              height: 300,
              child: FutureBuilder(
                future: getByUser(cliente.id),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Não foram encontrados registros');
                  } else if (snapshot.hasData) {
                    print(snapshot.data);
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          print(snapshot.data!.length);
                          return ListTile(
                            style: ListTileStyle.list,
                            title: Text(
                                snapshot.data![index]['barbearia']['nome']),
                            subtitle: Text(
                                dataFormat(snapshot.data![index]['data_atv'])),
                          );
                        });
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            MenuBottom(
                icon1: Icon(Icons.arrow_back),
                icon2: Icon(Icons.search),
                icon3: Icon(Icons.draw_outlined)),
          ],
        ),
      ),
    );
  }

  dataFormat(String date) {
    String year = date.substring(0, 4);
    String month = date.substring(5, 7);
    String day = date.substring(8, 10);

    String hour = date.substring(11, 16);

    return '${hour} ${day}/${month}/${year}';
  }
}
