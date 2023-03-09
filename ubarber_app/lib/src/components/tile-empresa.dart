import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListEmpresa extends StatelessWidget {
  final List<InfoMockupEmp> items;

  const ListEmpresa({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return _build();
  }

  Widget _build() => Container(
      width: 315,
      height: 500,
        color: Colors.transparent,
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: ((context, index) {
            final item = items[index];
            return Container(
              height:70,
              width: 200,
              margin: EdgeInsets.only(bottom: 3),
              child: ListTile(
                title: item.buildTitle(context),
                subtitle: item.buildSubtitle(context),
                onTap: () => {print("clicou no item $index")},
                tileColor: Colors.transparent,
              ),
          );
        })),
      );
}

abstract class InfoMockupEmp {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class InfoBTNEmpresa implements InfoMockupEmp {
  final String nomeEmp;
  final String endereco;

  InfoBTNEmpresa(this.nomeEmp, this.endereco);

  @override
  Widget buildTitle(BuildContext context) => Text(nomeEmp);
  @override
  Widget buildSubtitle(BuildContext context) => Text(endereco);
}
