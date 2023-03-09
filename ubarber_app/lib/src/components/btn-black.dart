import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubarber_app/src/classes/users.dart';
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
  selectMethod() {
    if (widget.method == LOGIN) {
      User _user = User(username: 'matheus', password: 'senha', manter: true);
      return login(_user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll<Size>(Size(278, 68)),
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
        ),
        onPressed: this.selectMethod(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )
          ],
        ));
  }
}
