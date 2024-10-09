import 'package:flutter/material.dart';
import 'package:flutteraula02/data/task_inherited.dart';
import 'package:flutteraula02/screens/home_screen.dart';
//import 'package:flutteraula02/screens/initial_screen.dart';

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
      home: TaskInherited(child: const HomeScreen()),  // --- importada a inherited e ajustado a navegação aqui
    );
  }
}
//main básica para início de app

