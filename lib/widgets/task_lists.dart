import 'package:flutter/material.dart';
import 'an_task_tiles.dart';
import 'package:todoey_list/tasks.dart';

class TaskLists extends StatefulWidget {
  List<Tasks> list;
  TaskLists(this.list);

  @override
  _TaskListsState createState() => _TaskListsState();
}

class _TaskListsState extends State<TaskLists> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, count) {
        return TaskTiles(
          widget.list[count].name,
          widget.list[count].isDone,
          (newValue) {
            setState(() {
              widget.list[count].toggleDone();
            });
          },
        );
      },
      itemCount: widget.list.length,
    );
  }
}
