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
            final task = taskdata.list[count];
            return TaskTiles(task.name, task.isDone, (newValue) {
              task.toggleDone();
              taskdata.updateLists();
            }, () {
              taskdata.deleteLists(task);
            });
          },
          itemCount: taskdata.taskCount,
        );
      },
    );
  }
}
