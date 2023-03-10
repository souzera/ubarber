import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubarber_app/src/components/avatar.dart';
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
          Avatar(
            username: "Blue Pen", 
            url: "https://s2.glbimg.com/gZrnzQkY70EZ2ZP0zwB689bUAak=/0x0:5184x3456/1008x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2020/9/e/EYKMBXR72tNdkUAgmZzQ/azul-caneta.jpg",),
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
