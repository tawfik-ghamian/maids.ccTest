import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/task_list_model.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() => _instance;

  SharedPrefs._internal();

  static Future<SharedPreferences> _prefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> setTasks(TaskList tasks) async {
    final prefs = await _prefs();
    final encodedTasks = TaskList.toJson(tasks);
    await prefs.setString('tasks', jsonEncode(encodedTasks));
  }

  Future<TaskList> getTasks() async {
    final prefs = await _prefs();
    final tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      return TaskList.fromJson(jsonDecode(tasksString));
    } else {
      return TaskList.fromJson({});
    }
  }
}
