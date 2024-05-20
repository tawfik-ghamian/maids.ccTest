import 'package:flutter/material.dart';

import '../api/auth_api.dart';
import '../view/task_list_screen.dart';

class AuthController with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> login(String username, String password, context) async {
    try {
      _isLoading = true;
      notifyListeners();
      final statusCode = await AuthApi.login(username, password);
      if (statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TaskListScreen(),
            ));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.lightGreen,
              content: Text('login Successfully.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Login failed! Please check your credentials.')),
        );
      }
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print('Error during login: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red,
            content: Text('An error occurred. Please try again.')),
      );
    }
  }

  Future<bool> isLoggedIn(context) async {
    try {
      _isLoading = true;
      notifyListeners();
      final hasUser = await AuthApi.getAuthToken();
      if (hasUser == null) {
        return false;
      }
    } catch (error) {
      print("Error: $error");
    }
    return true;
  }
}
