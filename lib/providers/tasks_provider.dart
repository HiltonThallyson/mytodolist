import 'package:flutter/cupertino.dart';

import '../models/task_model.dart';

class Tasks with ChangeNotifier {
  final Map<String, Task> _tasks = {};
  final List<Task> _completedTasks = [];

  Map<String, Task> get tasks {
    return _tasks;
  }

  List<Task> get completedTasks {
    return _completedTasks;
  }

  void addTaskToMap(Task newTask) {
    _tasks.putIfAbsent(newTask.id, () => newTask);
    notifyListeners();
  }

  void deleteTaskFromMap(String id) {
    _tasks.remove(id);
    notifyListeners();
  }

  void markTaskAsCompletedUsingId(String id) {
    _completedTasks.add(_tasks[id]!);
    deleteTaskFromMap(id);
  }
}
