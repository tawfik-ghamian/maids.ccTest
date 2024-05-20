import 'package:flutter/material.dart';
import 'package:test_project/controller/splach_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashController = SplashController();

  @override
  void initState() {
    print("hello");
    splashController.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.lightBlueAccent,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome To Task App",
                style: TextStyle(fontSize: 22),
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
