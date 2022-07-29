import 'package:flutter/material.dart';

import '../widgets/tasks_list.dart';
import '../widgets/main_drawer.dart';
import '../widgets/task_form.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks')),
      drawer: MainDrawer(),
      body: Container(
        alignment: Alignment.topLeft,
        child: TasksList(),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        child: const Icon(
          Icons.add,
          size: 35,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => TaskForm());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
