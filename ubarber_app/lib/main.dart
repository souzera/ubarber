import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash_view/source/presentation/pages/pages.dart';
import 'package:splash_view/source/presentation/presentation.dart';
import 'package:ubarber_app/src/classes/users.dart';
import 'package:ubarber_app/src/components/logo.dart';
import 'package:ubarber_app/src/components/tile-empresa.dart';
import 'package:ubarber_app/src/pages/cadastro-cliente.dart';
import 'package:ubarber_app/src/pages/list-barbearia.dart';
// ignore: unused_import
import 'package:ubarber_app/src/pages/login.dart';
import 'package:ubarber_app/src/pages/profile.dart';
import 'package:ubarber_app/src/pages/testes.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
    DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: SplashView(
          backgroundColor: Colors.white,
          logo: MyLogo(),
          done: Done(Center(
              child:
                  //TelaTestes(),
                  //TelaProfile(
                  //  usuario: User(
                  //    username: "Cafezinho", 
                  //    password: '123', 
                  //    manter: true),
                  //  ctx: 1,
                  //)

              TelaLista(items: List<InfoMockupEmp>.generate(10,((i)=> InfoBTNEmpresa('Barbearia Estilo $i', 'Avenida Presidente Prudente nº$i')),))
              ))),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(),
        '/cadastro': (BuildContext context) => new FormCadastro(),
        '/barbearia' : (BuildContext context) => TelaProfile(ctx: 1),
        '/cliente':(BuildContext context) => TelaProfile(ctx: 0)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
      body: Center(
        child: const Text("Olá Mundo"),
      ),
    );
  }
}
