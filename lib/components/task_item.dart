import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TaskItem extends StatelessWidget {
  final Task _task;
  final Function _deleteTask;

  TaskItem(this._task, this._deleteTask);
  @override
  Widget build(BuildContext context) {
    return Card(
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
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.check,
                      color: Colors.green[800],
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () => _deleteTask(_task.id)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
