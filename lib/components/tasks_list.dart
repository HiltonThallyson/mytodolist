import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TasksList extends StatelessWidget {
  final List<Task> _tasks;

  TasksList(this._tasks);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      height: 600,
      width: double.infinity,
      child: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: ListTile(
                  horizontalTitleGap: 30,
                  leading: Container(
                    height: 60,
                    width: 70,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      _tasks[index].priority,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  title: Text(_tasks[index].title),
                ),
              ),
            );
          }),
    );
  }
}
