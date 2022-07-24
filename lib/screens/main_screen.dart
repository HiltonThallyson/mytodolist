import 'package:flutter/material.dart';
import 'package:my_todo_app/components/tasks_list.dart';
import '/models/task_model.dart';

import '/components/task_form.dart';

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
      drawer: Drawer(child: Text('Teste')),
      body: Container(
        alignment: Alignment.topLeft,
        child: TasksList(_tasks),
      ),
      floatingActionButton: FloatingActionButton(
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
