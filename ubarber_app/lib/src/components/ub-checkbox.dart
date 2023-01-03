import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxUB extends StatefulWidget {
  final String title;

  const CheckboxUB({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _CheckboxUB();
}

class _CheckboxUB extends State<CheckboxUB> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            activeColor: Colors.black,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            }),
        Text(widget.title),
      ],
    );
  }
}
