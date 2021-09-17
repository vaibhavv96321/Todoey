import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoey_list/models/task_data.dart';
import 'screens/task_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => TaskData(),
    child: MyApp(),
  ));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.lightBlueAccent,
    systemNavigationBarColor: Colors.white,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(),
    );
  }
}
