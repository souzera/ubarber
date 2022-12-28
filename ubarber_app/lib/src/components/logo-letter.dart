// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubarber_app/src/styles/icons.dart';

class LogoLetter extends StatelessWidget {
  const LogoLetter({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(logoLetterBlack);
  }
}


//return Scaffold(body: Center(child: const Text("Ubarber",style: TextStyle(fontSize: 64,),)),);