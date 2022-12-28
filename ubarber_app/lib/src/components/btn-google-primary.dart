import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubarber_app/src/styles/icons.dart';

class PrimaryGoogleButton extends StatefulWidget {
  final String title;

  const PrimaryGoogleButton({Key? key, required this.title}): super(key: key);
  
  @override
  State<StatefulWidget> createState() => StateGoogleButton();
}

class StateGoogleButton extends State<PrimaryGoogleButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
              style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll<Size>(Size(278, 68)),
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                side: MaterialStatePropertyAll<BorderSide>(BorderSide(color: Color.fromRGBO(217, 217, 217, 100))),
                
              ),
              onPressed: (() {
                print("Clicou");
              }), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(logoGoogle),
                  Text(widget.title),
                ],)
              );
  }
}
