import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/controller/auth_controller.dart';
import 'package:test_project/controller/task_controller.dart';
import 'package:test_project/view/splash_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>(create: (_) =>AuthController()),
        ChangeNotifierProvider<TaskController>(create: (_) =>TaskController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Task App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
