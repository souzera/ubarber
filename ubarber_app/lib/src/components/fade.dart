import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int FADEEND = 0;
int FADESTART = 1;

class Fade extends StatelessWidget {
  final int typeFade;

  Fade({super.key, required this.typeFade});

  @override
  Widget build(BuildContext context) {
    Alignment _begin = Alignment.bottomCenter;
    Alignment _end = Alignment.topCenter;

    switch (typeFade) {
      case 0:
        _begin = Alignment.topCenter;
        _end = Alignment.bottomCenter;
        break;
      case 1:
        _begin = Alignment.bottomCenter;
        _end = Alignment.topCenter;
        break;
    }

    return Positioned(
        left: 0,
        right: 0,
        height: 3,
        child: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: _begin,
              end: _end,
              stops: [0.0, 1.0],
              colors: [Colors.white.withOpacity(0), Colors.white])),
    ));
  }
}
