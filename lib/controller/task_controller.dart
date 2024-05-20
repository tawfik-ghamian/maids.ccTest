import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_project/model/task_model.dart';

import '../api/task_api.dart';
import '../model/task_list_model.dart';
import '../utils/shared_prefs.dart';

class TaskController with ChangeNotifier {
  TaskList _tasks = TaskList.fromJson(
      {"todos": <Task>[], "total": 150, "skip": 0, "limit": 10});
  bool _isLoading = false;

  TaskList get tasks => _tasks;

  bool get isLoading => _isLoading;

  bool setIsLoading(loading) => _isLoading = loading;

  Future<void> storeInitTasks() async {
    _isLoading = true;

    try {
      print("hello2");
      final tasks = await TaskApi.fetchTasksList(0);

      await SharedPrefs().setTasks(tasks);
    } catch (error) {
      print("Error: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMoreTasks(counter) async {
    _isLoading = true;
    notifyListeners();
    try {
      final tasks = await TaskApi.fetchTasksList(counter);
      if (tasks.todos.isNotEmpty) {
        print(_tasks.todos.length);
        _tasks.todos.addAll(tasks.todos);
        print(_tasks.todos.length);
        await SharedPrefs().setTasks(_tasks);
      }
    } catch (error) {
      print("Error:$error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchTasks() async {
    _isLoading = true;
    try {
      _tasks = await SharedPrefs().getTasks();
    } catch (error) {
      print('Error fetching tasks: $error');
    } finally {
      _isLoading = false;
    }
  }

  Future<void> addTask(String title) async {
    _isLoading = true;
    notifyListeners();
    try {
      final userId = await TaskApi.storage.read(key: 'user_id');
      print(userId);
      final newTask = Task(
        todo: title,
        completed: false,
        userId: int.parse(userId!),
      );
      // print()
      final response = await TaskApi.addTask(newTask);
      _tasks.todos.add(response);
      await SharedPrefs().setTasks(_tasks);
    } catch (error) {
      print('Error adding task: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> completeTask(Task t, bool completed) async {
    _isLoading = true;
    notifyListeners();
    try {
      final index = _tasks.todos.indexWhere((task) => task.id == t.id);
      if (index != -1) {
        _tasks.todos[index] = Task(
            id: t.id, todo: t.todo, completed: completed, userId: t.userId);
        await SharedPrefs().setTasks(_tasks);
      }
    } catch (error) {
      print('Error update task: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteTask(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      _tasks.todos.removeWhere((task) => task.id == id);
      await SharedPrefs().setTasks(_tasks);
    } catch (error) {
      print('Error delete task: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
