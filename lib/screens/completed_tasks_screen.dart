import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/task_card.dart';
import '../widgets/main_drawer.dart';
import '../providers/tasks_provider.dart';

class CompletedTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<Tasks>(context, listen: false);
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(title: const Text('Completed Tasks')),
        body: tasksProvider.completedTasks.isNotEmpty
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListView(
                  children: tasksProvider.completedTasks
                      .map((task) => TaskCard(task))
                      .toList(),
                ),
              )
            : const Center(
                child: Text('You dont have any completed tasks.'),
              ));
  }
}
