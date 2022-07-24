import 'package:flutter/material.dart';

import '../components/tasks_list.dart';
import '../models/task_model.dart';
import '../components/main_drawer.dart';
import '../components/task_form.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Task> _tasks = [];

  void _addNewTask(Task newTask) {
    setState(() {
      _tasks.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks')),
      drawer: MainDrawer(),
      body: Container(
          alignment: Alignment.topLeft,
          child: _tasks.isNotEmpty
              ? TasksList(_tasks)
              : Center(
                  child: Text(
                    'You dont have any tasks!',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                )),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        child: const Icon(
          Icons.add,
          size: 35,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => TaskForm(_addNewTask));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
