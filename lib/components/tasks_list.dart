import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TasksList extends StatelessWidget {
  final List<Task> _tasks;

  TasksList(this._tasks);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: 600,
      width: double.infinity,
      child: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (ctx, index) {
            return Card(
              color: Colors.blueGrey[900],
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
                            width: 1,
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      _tasks[index].priority,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    _tasks[index].title,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
