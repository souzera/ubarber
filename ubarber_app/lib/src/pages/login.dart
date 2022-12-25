import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubarber_app/src/components/logo-letter.dart';
import 'package:ubarber_app/src/components/logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(), 
    );
  }

  //construindo o layout
  //ref. Flutter Catalog
  Widget _buildBody() => Container(
        color: Colors.green,
        child: const LogoLetter(),
      );
}
