import 'package:flutteraula02/components/task.dart';
import 'package:flutteraula02/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  //não esquecer que usamos o '_' nos nomes das variáveis
  //pq indica que estas são privadas
  static const String _tablename = '_taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'dificuldade';
  static const String _image = 'imagem';

  //método save
  save(Task tarefa) async {}
    Future<List<Task>> findAll() async{
      final Database bancoDeDados = await getDatabase();
      final List<Map<String, dynamic>> result = await bancoDeDados.query(_tablename);
      return toList(result);
    }
  //transformar o mapa em uma lista de tarefas
    List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
      final List<Task> tarefas = [];
      for (Map<String,dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
      }
      return tarefas;

    }

    Future<List<Task>> find(String nomeDaTarefa ) async{}
    delete(String nomeDaTarefa) async{}
  }
}
