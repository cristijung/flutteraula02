import 'package:flutter/material.dart';
import 'package:flutteraula02/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited ({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/flutter.png', 3),
    Task('Aprender Dart', 'assets/images/dart.png', 2),
    Task('Aprender Kotlin', 'assets/images/kotlin.png', 5),
    Task('Aprender React', 'assets/images/react.png', 4),
    Task('Aprender Python', 'assets/images/python.png', 1),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static  TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    return result ?? TaskInherited(child: Container());
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}

//correção da inherited
//problema é que estava usando context.dependOnInheritedWidgetOfExactType<TaskInherited>(),
// que retorna um valor anulável (TaskInherited?). No entanto, você está usando result! na linha seguinte,
// o que força o desempacotamento de um valor potencialmente nulo. Isso pode causar um erro em tempo de execução se result for nulo.
//Para corrigir esse problema, você pode usar o operador de coalescência nula (??) para fornecer um valor padrão caso result seja nulo.