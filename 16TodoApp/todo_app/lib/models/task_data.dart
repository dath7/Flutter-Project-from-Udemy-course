import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TasksData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Sleep', isDone: false),
    Task(name: 'Sleep', isDone: false),
  ];
  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
