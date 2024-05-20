import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controller/task_controller.dart';
import 'widget/add_task_widget.dart';
import 'widget/task_tile_widget.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    final taskProvider = Provider.of<TaskController>(context);
    int counter = 0;

    void onRefresh() async {
      await Future.delayed(const Duration(milliseconds: 1000), () {
        taskProvider.storeInitTasks();
        taskProvider.fetchTasks();
      });
      counter = 0;
      _refreshController.refreshCompleted();
    }

    void onLoading() async {
      counter++;
      await Future.delayed(const Duration(milliseconds: 1000), () async {
        print(counter);
        taskProvider.fetchMoreTasks(counter);
      });
      _refreshController.loadComplete();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        actions: [
          Center(
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTaskForm()),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: taskProvider.fetchTasks(), // Fetch tasks on build
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (taskProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SmartRefresher(
              controller: _refreshController,
              enablePullUp: true,
              enablePullDown: true,
              onRefresh: onRefresh,
              onLoading: onLoading,
              child: ListView.builder(
                itemCount: taskProvider.tasks.todos.length,
                itemBuilder: (context, index) {
                  final task = taskProvider.tasks.todos[index];
                  return TaskTile(task: task);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
