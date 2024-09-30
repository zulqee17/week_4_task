import 'package:flutter/material.dart';
import 'package:week_four_task_ip/screens/slpash_screen.dart';
import 'package:week_four_task_ip/screens/task_screen.dart';

import 'local_db/todo_db_box.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TodoDbBox.getHiveInitFunction();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenSplash(),
    );
  }
}
