import 'package:flutter/material.dart';
import 'package:ubarber_app/src/components/logo-letter.dart';
import 'package:ubarber_app/src/modules/barbearias/get-barber.dart';

import '../components/menu-bottom.dart';

class ListBarbearias extends StatefulWidget {
  const ListBarbearias({Key? key}) : super(key: key);

  @override
  State<ListBarbearias> createState() => _ListBarbeariasState();
}

class _ListBarbeariasState extends State<ListBarbearias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          LogoLetter(),
          Container(
            height: 550,
            width: 300,
            child: FutureBuilder(
              future: getBarbearias(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Falha ao tentar carregar');
                } else if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data![index]['nome']),
                          subtitle: Text(snapshot.data![index]['local']),
                          onTap: () {
                            //TODO: acessar o perfil da barbearia
                            print("TODO: acessar o perfil da barbearia");
                          },
                        );
                      });
                }return CircularProgressIndicator();
              },
            ),
          ),
          MenuBottom(
            icon1: Icon(Icons.arrow_back),
            icon2: Icon(Icons.person_outline),
            icon3: Icon(Icons.star_outline),
          )
        ],
      ),
    );
  }
}
