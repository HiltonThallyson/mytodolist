import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tasks_provider.dart';
import '../widgets/task_item.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _tasks = Provider.of<Tasks>(context);
    return _tasks.tasks.isNotEmpty
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            height: 600,
            width: double.infinity,
            child: ListView.builder(
                itemCount: _tasks.tasks.length,
                itemBuilder: (ctx, index) {
                  return TaskItem(_tasks.tasks.values.elementAt(index));
                }),
          )
        : const Center(
            child: Text('You dont have any tasks.'),
          );
  }
}
