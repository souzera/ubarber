import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonBlack extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BlackButton();
}


class _BlackButton extends State<ButtonBlack>{
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll<Size>(Size(278, 68)),
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
      ),
      onPressed: ((){}), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),)
      ],));
  }
}