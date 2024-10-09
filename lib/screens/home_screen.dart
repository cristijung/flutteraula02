import 'package:flutter/material.dart';
import 'package:flutteraula02/screens/api_screen.dart';
import 'package:flutteraula02/screens/initial_screen.dart';

import '../data/task_inherited.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tela Inicial',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 4,
        leading: const Icon(Icons.home, color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaskInherited(child: const InitialScreen())),
                );
              },
              child: const Text('Tarefas'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ApiScreen()),
                );
              },
              child: const Text('Ver gatos'),
            ),
          ],
        ),
      ),
    );
  }
}