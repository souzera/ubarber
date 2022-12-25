import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubarber_app/src/styles/icons.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(logoBlack));
    //throw UnimplementedError();
  }
}
