import 'task_model.dart';

class TaskList {
  final List<Task> todos;
  final int total;
  final int skip;
  final int limit;

  const TaskList({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  static Map<String, dynamic> toJson(TaskList taskList) => {
    'todos': taskList.todos.map((task) => Task.toJson(task)).toList(),
    'total': taskList.total,
    'skip': taskList.skip,
    'limit': taskList.limit,
  };

  factory TaskList.fromJson(Map<String, dynamic> json) => TaskList(
    todos: (json['todos'] as List).map((task) => Task.fromJson(task)).toList(),
    total: json['total'],
    skip: json['skip'],
    limit: json['limit'],
  );
}