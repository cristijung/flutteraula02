import 'package:flutter/material.dart';
import 'package:flutteraula02/screens/form_screen.dart';
import 'package:flutteraula02/data/task_inherited.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  //bool opacidade = true; //---- ver aqui depois ou colocar outro btn lá embaixo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(  //listView colocdado de forma dinâmica para receber as tarefas definidas na inherited
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(  //colocado o navigator
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context,),
            ),
          );
        },
        child: const Icon(Icons.add, size:35, color: Colors.white),
        backgroundColor: Colors.indigo,
        elevation: 4, // ícone trocado pelo add
      ),
    );
  }
}


