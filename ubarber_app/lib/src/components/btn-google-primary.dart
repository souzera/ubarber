import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubarber_app/src/styles/icons.dart';

class PrimaryGoogleButton extends StatefulWidget {
  const PrimaryGoogleButton({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() => StateGoogleButton();
}

class StateGoogleButton extends State<PrimaryGoogleButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll<Size>(Size(278, 68)),
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
              onPressed: (() {
                print("Clicou");
              }), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(logoGoogle),
                  const Text("Logar com Google",
                  style: TextStyle(fontSize: 20),),
                ],)
              );
  }
}
