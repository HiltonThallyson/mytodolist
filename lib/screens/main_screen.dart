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
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: const ListTile(
                leading: Icon(Icons.menu),
                title: Text('My Tasks'),
                horizontalTitleGap: 100,
              )),
          Container(alignment: Alignment.topLeft, child: TasksList(_tasks)),
        ],
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(const Size(120, 50)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
        child: Row(
          children: const [Icon(Icons.add), Text('New Task')],
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => TaskForm(_addNewTask));
        },
      ),
    );
  }
}
