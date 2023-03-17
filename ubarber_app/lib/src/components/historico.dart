import 'package:flutter/cupertino.dart';
import 'package:ubarber_app/src/components/tile-list.dart';

class Historico extends StatelessWidget {
  final List<InfoMockup> items;

  const Historico({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 400,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: 
        ListTiles(items: items),
    );
  }
}
