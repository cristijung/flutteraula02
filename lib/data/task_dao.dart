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

  //função Save - save
  //usando a função save para salvar a tarefa, abrimos o banco de dados e verificamos se a tarefa já existe.
  // se a tarefa não existir, ....se estiver vazia a lista, será inserida no banco de dados a tarefa em formato de mapa,
  // mas ainda esse formato de mapa.
  // se a tarefa já existe, então será acessado o bd e vai dar um update na tabela específica, com os novos valores que foram encontrados na tarefa.
  // esses valores, vão ser substituídos na posição onde estava o nome da nossa tarefa antiga.
  save(Task tarefa) async {
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    if (itemExists.isEmpty) {
      return await bancoDeDados.insert(_tablename, values);
    } else {
      return await bancoDeDados.update(
        _tablename,
        values,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }

    //find all
    Future<List<Task>> findAll() async {
      final Database bancoDeDados = await getDatabase();
      final List<Map<String, dynamic>> result =
          await bancoDeDados.query(_tablename);
      return toList(result);
    }

    //método para transformar o mapa em uma lista de tarefas
    List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
      final List<Task> tarefas = [];
      for (Map<String, dynamic> linha in mapaDeTarefas) {
        final Task tarefa =
            Task(linha[_name], linha[_image], linha[_difficulty]);
        tarefas.add(tarefa);
      }
      return tarefas;
    }

    //find
    Future<List<Task>> find(String nomeDaTarefa) async {
      final Database bancoDeDados = await getDatabase();
      final List<Map<String, dynamic>> result = await bancoDeDados.query(
        _tablename,
        where: '$_name = ?',
        whereArgs: [nomeDaTarefa],
      ); //ver aqui depoisssss
      return toList(result);
    }

    delete(String nomeDaTarefa) async {}
  }
}
