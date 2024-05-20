import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/model/user_model.dart';

import '../const/api_urls.dart';
import '../model/task_list_model.dart';
import '../model/task_model.dart';

class TaskApi {
  static const storage = FlutterSecureStorage();


  static Future<TaskList> fetchTasksList(int page) async {
    final response = await http.get(
      Uri.parse('${ApiUrls.baseUrl}/todos?limit=10&skip=${page * 10}'),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final data = TaskList.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to fetch tasks'); // Handle error
    }
  }

  // static Future<List<Task>> fetchTasks() async {
  //   try {
  //     final response = await http.get(Uri.parse('${ApiUrls.baseUrl}/todos'));
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       final tasks = data['todos'] as List;
  //       return tasks.map((task) => Task.fromJson(task)).toList();
  //     } else {
  //       print('Error fetching tasks: Status code ${response.statusCode}');
  //       throw Exception('Failed to fetch tasks');
  //     }
  //   } catch (error) {
  //     print('Error fetching tasks: $error');
  //     throw Exception('Failed to fetch tasks');
  //   }
  // }

  static Future<Task> addTask(Task task) async {
    try {

      final response = await http.post(
        Uri.parse('${ApiUrls.baseUrl}/todos/add'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'todo':task.todo,
          'completed':task.completed,
          'userId':task.userId
        }),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to add task');
      }
      return Task.fromJson(jsonDecode(response.body));
    } catch (error) {
      print('Error adding tasks: $error');
      throw Exception('Failed to add tasks');
    }
  }

  static Future<void> completeTask(int id, bool complete) async {
    try {
      final response = await http.put(
        Uri.parse('${ApiUrls.baseUrl}/todos/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'completed': complete}),
      );
      print(response.statusCode);
      if (response.statusCode != 200) {
        throw Exception('Failed to update task');
      }
    } catch (error) {
      print('Error completing tasks: $error');
      throw Exception('Failed to complete tasks');
    }
  }

  static Future<void> deleteTask(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('${ApiUrls.baseUrl}/todos/$id'),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to delete task');
      }
    } catch (error) {
      print('Error deleting tasks: $error'); // Log the error for debugging
      throw Exception(
          'Failed to delete tasks'); // Or provide a more specific error message
    }
  }
}
