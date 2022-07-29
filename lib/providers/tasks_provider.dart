import 'package:flutter/cupertino.dart';

import '../models/task_model.dart';

class Tasks with ChangeNotifier {
  Map<String, Task> _tasks = {};

  Map<String, Task> get tasks {
    return _tasks;
  }

  void addTaskToMap(Task newTask) {
    _tasks.putIfAbsent(newTask.id, () => newTask);
    notifyListeners();
  }

  void deleteTaskFromMap(String id) {
    _tasks.remove(id);
    notifyListeners();
  }
}
