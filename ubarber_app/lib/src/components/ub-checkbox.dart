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
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                activeColor: Colors.black,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                  print(isChecked);
                }),
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text(widget.title),
        ],
      ),
    );
  }
}
