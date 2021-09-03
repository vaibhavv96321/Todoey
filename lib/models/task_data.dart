import 'package:flutter/material.dart';
import 'tasks.dart';

class TaskData extends ChangeNotifier {
  List<Tasks> list = [
    Tasks(name: 'Buy Bread'),
    Tasks(name: 'Do Homework'),
    Tasks(name: 'Buy Fruits'),
  ];

  int get taskCount //used to read or get the data of the class field
  {
    return list.length;
  }

  void updateCallback() {}
}
