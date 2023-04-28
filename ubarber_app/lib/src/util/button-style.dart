import 'package:flutter/material.dart';


ButtonStyle styleBlack() {
  return ButtonStyle(
    fixedSize: MaterialStatePropertyAll<Size>(Size(270, 60)),
    backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
  );
}