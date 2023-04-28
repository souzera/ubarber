import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String username;
  final String url;

  Avatar({super.key, required this.username, required this.url});

  @override
  Widget build(BuildContext context) => _build();

  Widget _build() => Container(
        height: 240,
        width: 300,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(url),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Text(
            username,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          )
        ]),
      );
}
