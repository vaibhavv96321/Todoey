import 'package:todoey_list/models/task_data.dart';

class Tasks {
  final String name;
  bool isDone;

  Tasks({this.name = ' ', this.isDone = false});

  void toggleDone() async {
    isDone = !isDone;
    // if (isDone == true) {
    //   await Future.delayed(Duration(seconds: 1));
    //   TaskData().deleteLists(name);
    // }
  }
}
