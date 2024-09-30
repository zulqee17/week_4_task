import 'dart:async';

import 'package:flutter/material.dart';
import 'package:week_four_task_ip/screens/task_screen.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), loadScreen);
  }

  loadScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const TaskScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text(
          "Todo App",
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
      ),
    );
  }
}
