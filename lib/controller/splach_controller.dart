import 'package:flutter/material.dart';
import 'package:test_project/controller/auth_controller.dart';

import '../view/login_screen.dart';
import '../view/task_list_screen.dart';
import 'task_controller.dart';

class SplashController {
  final taskController = TaskController();

  void init(context) async {
    print("hello1");
    final authController = AuthController();
    Future.delayed(const Duration(seconds: 1), () async {
      await taskController.storeInitTasks();
      final isLogin = await authController.isLoggedIn(context);
      print(isLogin);
      if (!isLogin) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LogInScreen(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const TaskListScreen(),
            ));
      }
    });
  }
}
