import 'package:flutter/material.dart';
import 'package:flutteraula02/data/task_dao.dart';
import 'package:flutteraula02/screens/form_screen.dart';
import 'package:flutteraula02/screens/api_screen.dart';

import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.task_alt, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Tarefas',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                setState(() {}); //atualiza a tela ao pressionar o botão de refresh
              },
              icon: const Icon(Icons.refresh, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando'),
                      ],
                    ),
                  );
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando'),
                      ],
                    ),
                  );
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando'),
                      ],
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.error_outline,
                              size: 128,
                            ),
                            Text(
                              'Não há nenhuma Tarefa',
                              style: TextStyle(fontSize: 32),
                            ),
                          ],
                        ));
                  }
                  return const Text('Erro ao carregar tarefas');
              }
              return const Text('Erro desconhecido');
            }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contextNew) => FormScreen(
                    taskContext: context,
                  ),
                ),
              ).then((value) => setState(() {}));
            },
            child: const Icon(Icons.add, size: 35, color: Colors.white),
            backgroundColor: Colors.indigo,
            elevation: 4,
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              //navega para a ApiScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ApiScreen()),
              );
            },
            child: const Icon(Icons.pets, size: 35, color: Colors.white),
            backgroundColor: Colors.indigo,
            elevation: 4,
          ),
        ],
      ),
    );
  }
}