import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_model.dart';
import '../providers/tasks_provider.dart';

class TaskItem extends StatelessWidget {
  final Task _task;

  TaskItem(this._task);
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context);
    return Dismissible(
      key: ValueKey(tasks.tasks.keys.firstWhere((key) => key == _task.id)),
      secondaryBackground: Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.only(right: 15),
          child: Icon(
            Icons.delete,
            size: 40,
            color: Colors.blueGrey[700],
          )),
      background: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.only(left: 15),
          child: Icon(
            Icons.check,
            size: 30,
            color: Colors.blueGrey[700],
          )),
      onDismissed: ((direction) {
        if (direction == DismissDirection.startToEnd) {
          tasks.deleteTaskFromMap(_task.id);
        } else {
          tasks.deleteTaskFromMap(_task.id);
        }
      }),
      child: Card(
        color: Colors.blueGrey[900],
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 1),
          child: ListTile(
            horizontalTitleGap: 20,
            leading: Container(
              height: 40,
              width: 80,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  border: Border.all(
                      width: 1, color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                _task.priority,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: SizedBox(
              width: 300,
              child: Text(
                _task.title,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
