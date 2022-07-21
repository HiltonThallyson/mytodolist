import 'package:flutter/material.dart';
import '/models/task_model.dart';

import '/components/task_form.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Task> _tasks = [];

  void _addNewTask(Task newTask) {
    _tasks.add(newTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: const ListTile(
                leading: Icon(Icons.menu),
                title: Text('My Tasks'),
                horizontalTitleGap: 100,
              )),
          Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 300,
              width: 250,
              child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(_tasks[index].priority),
                      ),
                      title: Text(_tasks[index].title),
                    );
                  }),
            ),
          ),
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
