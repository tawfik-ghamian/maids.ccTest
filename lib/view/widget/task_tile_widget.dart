import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/task_controller.dart';
import '../../model/task_model.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskController>(context);

    return ListTile(
      title: Text(task.todo),
      trailing: Checkbox(
        value: task.completed,
        onChanged: (newValue) {
          print(newValue);
          taskProvider.completeTask(task, newValue!);
        },
      ),
      onLongPress: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Task?'),
          content: Text('Are you sure you want to delete "${task.todo}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                taskProvider.deleteTask(task.id!);
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
