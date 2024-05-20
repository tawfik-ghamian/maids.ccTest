// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import '../repositories/task_repository.dart'; // Replace with your task repository's path
// import '../models/task.dart'; // Replace with your task model's path
// import 'mock_api_client.dart'; // Replace with your mock API client's path
//
// void main() {
//   group('Task repository tests', () {
//     test('fetchTasks - success', () async {
//       final mockApiClient = MockApiClient();
//       when(mockApiClient.getTasks())
//           .thenAnswer((_) => Future.value(MockResponse(200, '{}')));
//
//       final repository = TaskRepository(apiClient: mockApiClient);
//       final tasks = await repository.fetchTasks();
//
//       // Verify fetch was called with the correct endpoint
//       verify(mockApiClient.getTasks()).called(1); // Assuming getTasks is used
//
//       // Assert tasks are empty (mock response is empty)
//       expect(tasks.isEmpty, true); // Adjust expectation based on actual response
//     });
//
//     test('fetchTasks - error', () async {
//       final mockApiClient = MockApiClient();
//       when(mockApiClient.getTasks()).thenAnswer((_) => Future.error(Exception('Network error')));
//
//       final repository = TaskRepository(apiClient: mockApiClient);
//
//       // Expect exception when fetching tasks
//       expect(() => repository.fetchTasks(), throwsException);
//     });
//
//   });
// }
