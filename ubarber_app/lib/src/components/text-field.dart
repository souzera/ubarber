import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String placeholder;
  final bool obscureText;

  const MyTextField(
      {Key? key, required this.placeholder, required this.obscureText})
      : super(key: key);

  //false - para texto normal
  //true - para senhas

  @override
  State<StatefulWidget> createState() => _MyTextField();
}

class _MyTextField extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        autocorrect: false,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: widget.placeholder,
        ),
      ),
    );

    /* return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text(
              widget.placeholder,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
      ],
    ); */
  }
}

/* Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your username 01',
            ),
          ),
        ) */
