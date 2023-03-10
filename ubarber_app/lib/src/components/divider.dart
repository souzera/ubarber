import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDivider extends StatefulWidget {
  const MyDivider({super.key});

  @override
  State<MyDivider> createState() => _MyDividerState();
}

class _MyDividerState extends State<MyDivider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 5, bottom: 3),
      width: 278,
      height: 21,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "ou",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(126, 126, 126, 100),
                ),),
          ],
        ),
    );
  }
}
