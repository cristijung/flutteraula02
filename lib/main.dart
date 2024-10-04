import 'package:flutter/material.dart';
import 'package:flutteraula02/screens/form_screen.dart';
import 'package:flutteraula02/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App com telas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InitialScreen(), //aqui vai a tela que a gente vai criar
    );
  }
}
//main básica para início de app

