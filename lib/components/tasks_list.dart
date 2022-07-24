import 'package:flutter/material.dart';
import 'package:my_todo_app/components/task_item.dart';

import '../models/task_model.dart';

class TasksList extends StatefulWidget {
  final List<Task> _tasks;

  TasksList(this._tasks);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  void _deleteTaskWithId(String id) {
    setState(() {
      widget._tasks.removeWhere((task) => task.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: 600,
      width: double.infinity,
      child: ListView.builder(
          itemCount: widget._tasks.length,
          itemBuilder: (ctx, index) {
            return TaskItem(widget._tasks[index], _deleteTaskWithId);
          }),
    );
  }
}
