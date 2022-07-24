import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_todo_app/models/task_model.dart';

class TaskForm extends StatefulWidget {
  final Function _onSubmit;

  TaskForm(this._onSubmit);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, dynamic>{};

  String? _priority = 'Medium';

  final _titleController = TextEditingController();

  _submitTask() {
    _formData['title'] = _titleController.text;
    _formData['priority'] = _priority;
    final newTask = Task(
        id: Random().nextDouble().toString(),
        title: _formData['title'],
        priority: _formData['priority']);

    widget._onSubmit(newTask);
    Navigator.of(context).pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Priority'),
                    value: _priority,
                    items: const [
                      DropdownMenuItem(value: 'Low', child: Text('Low')),
                      DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                      DropdownMenuItem(value: 'High', child: Text('High'))
                    ],
                    onChanged: (value) {
                      setState(() {
                        _priority = value;
                      });
                    }),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () => _submitTask(),
                  child: const Text(
                    'Add task',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
