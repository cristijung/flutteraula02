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
    assert(result != null, 'No  found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
