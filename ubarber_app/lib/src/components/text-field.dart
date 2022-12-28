import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String placeholder;
  final bool obscureText;

  const MyTextField({Key? key, required this.placeholder, required this.obscureText}) : super(key: key);

  //false - para texto normal
  //true - para senhas

  @override
  State<StatefulWidget> createState() => _MyTextField();
}

class _MyTextField extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text(widget.placeholder),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
      ],
    );
  }
}
