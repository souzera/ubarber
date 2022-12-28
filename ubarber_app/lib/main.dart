import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ubarber_app/src/pages/form-cadastro.dart';
// ignore: unused_import
import 'package:ubarber_app/src/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ubarber Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
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
      home: const FormCadastro(),
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
