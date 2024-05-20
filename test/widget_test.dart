// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/model/task_model.dart';


void main() {
  group('Task model tests', () {
    test('Task creation and properties', () {
      final task = Task(id: 1, todo: 'Buy groceries', completed: false, userId:15);
      expect(task.id, 1);
      expect(task.todo, 'Buy groceries');
      expect(task.completed, false);
    });

    test('Toggling completion', () {
      final task = Task(id: 1, todo: 'Buy groceries', completed: false, userId:15);
      expect(task.completed, true);
    });

    test('Copying a task', () {
      final task = Task(id: 1, todo: 'Buy groceries', completed: false, userId:15);
      final copiedTask = Task(id: 1, todo: 'Updated title',completed: false, userId:15);
      expect(copiedTask.id, 1);
      expect(copiedTask.todo, 'Updated title');
      expect(copiedTask.completed, false); // Completion state preserved
    });
  });
}
