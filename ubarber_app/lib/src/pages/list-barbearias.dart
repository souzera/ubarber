// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ubarber_app/src/components/logo-letter.dart';
import 'package:ubarber_app/src/modules/barbearias/barber.dart';
import 'package:ubarber_app/src/modules/barbearias/get-barber.dart';
import 'package:ubarber_app/src/modules/clientes/client.dart';
import 'package:ubarber_app/src/modules/clientes/get-cliente.dart';
import 'package:ubarber_app/src/pages/profile-cliente.dart';
import 'package:ubarber_app/src/pages/profile_barber.dart';

import '../components/menu-bottom.dart';
import '../modules/usuario/users.dart';

class ListBarbearias extends StatefulWidget {
  User usuario;

  ListBarbearias({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  State<ListBarbearias> createState() => _ListBarbeariasState();
}

class _ListBarbeariasState extends State<ListBarbearias> {
  findCliente() {
    Future<Cliente> cliente = getCliente(widget.usuario.username);
    return FutureBuilder(
      future: cliente,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Falha ao tentar buscar cliente');
        } else if (snapshot.hasData) {
          print('acessando cliente');
          Cliente _cliente = Cliente(
              id: snapshot.data!.id,
              user: snapshot.data!.user,
              nome: snapshot.data!.nome,
              telefone: snapshot.data!.telefone,
              status: snapshot.data!.status);
          print(_cliente);
          Get.to(ProfileCliente(
            cliente: _cliente,
          ));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

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
                        var barberuser =
                            snapshot.data![index]['user']['username'];
                        var url = '/profile/${barberuser}';
                        print(url);
                        return ListTile(
                          title: Text(snapshot.data![index]['nome']),
                          subtitle: Text(snapshot.data![index]['local']),
                          onTap: () {
                            //TODO: acessar o perfil da barbearia
                            print("TODO: acessar o perfil da barbearia");
                            Get.to(ProfileBarber(
                                barbearia:
                                    Barbearia.fromJson(snapshot.data![index])));
                          },
                        );
                      });
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Container(
              alignment: Alignment.center,
              width: 1100,
              height: 100,
              color: Color.fromARGB(100, 220, 220, 220),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    icon: Icon(Icons.exit_to_app),
                    highlightColor: Colors.blueGrey,
                  ),
                  IconButton(
                    onPressed: () {
                      Future<Cliente> cliente =
                          getCliente(widget.usuario.username);
                      Get.to(
                      Center(
                        child: FutureBuilder(
                          future: cliente,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text('Falha ao tentar buscar cliente');
                            } else if (snapshot.hasData) {
                              print('acessando cliente');
                              Cliente _cliente = Cliente(
                                  id: snapshot.data!.id,
                                  user: snapshot.data!.user,
                                  nome: snapshot.data!.nome,
                                  telefone: snapshot.data!.telefone,
                                  status: snapshot.data!.status);
                              return ProfileCliente(cliente: _cliente);
                            }
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      ));
                    },
                    icon: Icon(Icons.person_outline),
                  ),
                  IconButton(
                    onPressed: () {
                      print('clicou botao 3');
                    },
                    icon: Icon(Icons.star_outline),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
