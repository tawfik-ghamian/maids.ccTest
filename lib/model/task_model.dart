class Task {
  int? id;
  final String todo;
  final bool completed;
  final int userId;

  Task({
    this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  static Map<String, dynamic> toJson(Task task) => {
        'id': task.id,
        'todo': task.todo,
        'completed': task.completed,
        'userId': task.userId,
      };

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as int,
      todo: json['todo'] as String,
      completed: json['completed'] as bool,
      userId: json['userId'] as int,
    );
  }
}
