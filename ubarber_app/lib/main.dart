import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:splash_view/source/presentation/pages/pages.dart';
import 'package:splash_view/source/presentation/presentation.dart';
import 'package:ubarber_app/src/modules/barbearias/barber-getxcontroller.dart';
import 'package:ubarber_app/src/modules/usuario/users.dart';
import 'package:ubarber_app/src/components/logo.dart';
import 'package:ubarber_app/src/components/tile-list.dart';
import 'package:ubarber_app/src/modules/usuario/get-user.dart';
import 'package:ubarber_app/src/forms/login-form.dart';
import 'package:ubarber_app/src/pages/cadastro-cliente.dart';
import 'package:ubarber_app/src/pages/base/_________list--barbearia.dart';
import 'package:ubarber_app/src/pages/list-barbearias.dart';
// ignore: unused_import
import 'package:ubarber_app/src/pages/base/________login.dart';
import 'package:ubarber_app/src/pages/login.dart';
import 'package:ubarber_app/src/pages/base/__________profile.dart';
import 'package:ubarber_app/src/pages/profile_barber.dart';
import 'package:ubarber_app/src/pages/testes-dart.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
            name: "/",
            page: () => SplashView(
                backgroundColor: Colors.white,
                logo: MyLogo(),
                done: Done(Center(
                  child: TestesDart(),
                ))),
            children: [
              GetPage(
                name: '/login',
                page: () => Login(),
                //binding: HttpBindings(),
              ),
              GetPage(
                name: '/cadastro',
                page: () => FormCadastro(),
              ),
            ])
      ],
      debugShowCheckedModeBanner: false,
      title: 'Ubarber Demo',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          backgroundColor: Colors.white,
          fontFamily: 'Uber Move',
          // ignore: prefer_const_constructors
          appBarTheme: AppBarTheme(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.green,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            ),
          )),
    );
  }
}

