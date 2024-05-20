import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/task_controller.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _newTaskController = TextEditingController();

  @override
  void dispose() {
    _newTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _newTaskController,
                decoration: const InputDecoration(
                  labelText: 'Enter a new task',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    taskProvider.addTask(_newTaskController.text);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
