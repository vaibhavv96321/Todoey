import 'package:flutter/material.dart';
import 'package:todoey_list/models/task_data.dart';
import 'an_task_tiles.dart';
import 'package:provider/provider.dart';

class TaskLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context, count) {
            return TaskTiles(
              taskdata.list[count].name,
              taskdata.list[count].isDone,
              (newValue) {
                // taskdata.list[count].toggleDone();
              },
            );
          },
          itemCount: taskdata.taskCount,
        );
      },
    );
  }
}
