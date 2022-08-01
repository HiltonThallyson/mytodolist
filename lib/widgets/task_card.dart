import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/task_model.dart';

class TaskCard extends StatelessWidget {
  final Task _task;

  TaskCard(this._task);
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
          trailing: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Text(
                  DateFormat('MMMM').format(_task.date).length > 4
                      ? DateFormat('MMM, dd').format(_task.date)
                      : DateFormat('MMMM, dd').format(_task.date),
                  style: const TextStyle(fontSize: 14),
                ),
                Text(_task.date.year.toString(),
                    style: const TextStyle(fontSize: 12))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
