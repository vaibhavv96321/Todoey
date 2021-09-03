import 'package:flutter/material.dart';
import 'package:todoey_list/screens/new_add_screen.dart';
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

  void addLists() {
    list.add(Tasks(name: AddTasks.newTask));
    notifyListeners();
  }

  void updateLists() {
    notifyListeners();
  }

  void deleteLists(Tasks tasks) {
    list.remove(tasks);
    notifyListeners();
  }
}
