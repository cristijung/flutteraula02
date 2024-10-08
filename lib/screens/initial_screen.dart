import 'package:flutter/material.dart';
import 'package:flutteraula02/data/task_dao.dart';
import 'package:flutteraula02/screens/form_screen.dart';


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
              },
              icon: const Icon(Icons.refresh, color: Colors.white),
            ),
          ],
        ),
      ),
      //começando a conexão com o bd no body, a partir do FutureBuilding
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        //future pega os dados e building ... constroi
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(), //buscando o DAO e o método
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                //switch com snapchat.connectionState é a variável utilizada para comparar, conferir, switch(snapshot;connectionState)
              //nenhuma conexão
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text(
                            'Carregando'),
                      ],
                    ),
                  );
                //aguardando conexão
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando'),
                      ],
                    ),
                  );
                  //conexão ativa
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando'),
                      ],
                    ),
                  );
                  //conexão feita
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
            //add o then para dizer q a tela precisa ser reconstruída
            //atualizando o estado da tela inicial
          ).then((value) => setState(() {
            print('Recarregando a tela inicial');
          }));
        },
        child: const Icon(Icons.add, size:35, color: Colors.white),
        backgroundColor: Colors.indigo,
        elevation: 4, // ícone trocado pelo add
      ),
    );
  }
}
