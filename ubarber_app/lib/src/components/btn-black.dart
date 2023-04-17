import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubarber_app/src/modules/usuario/users.dart';
import 'package:ubarber_app/src/util/const.dart';
import 'package:ubarber_app/src/util/methods.dart';

class ButtonBlack extends StatefulWidget {
  final String title;
  final int method;

  const ButtonBlack({super.key, required this.method, required this.title});

  @override
  State<StatefulWidget> createState() => _BlackButton();
}

class _BlackButton extends State<ButtonBlack> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll<Size>(Size(270, 60)),
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
        ),
        onPressed: () => widget.method,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )
          ],
        ));
  }

  selectMethod(int codMethod) {
    switch (codMethod) {
      case 101:
        return loginMethod();
    }
  }

  loginMethod() {
    //Todo: autenticacao.
    Get.toNamed('/barbearias');
  }
}
