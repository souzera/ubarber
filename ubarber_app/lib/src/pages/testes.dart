import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubarber_app/src/components/fade.dart';

class TelaTestes extends StatelessWidget {
  const TelaTestes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Column(
        children: [
          Container(
            color: Colors.yellow,
            width: 315,
            height: 80,
          ),
          Container(
            color: Colors.red,
            width: 315,
            height: 180,
          ),
          Container(
            color: Colors.green,
            width: 315,
            height: 430,
            child: Fade(typeFade: 0),
          ),
        ],
      )),
    );
  }
}
