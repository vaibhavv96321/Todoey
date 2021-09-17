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

class EditedTaskList extends StatelessWidget {
  String newTextValue = '';

  bool focus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.maxFinite,
        child: Consumer<TaskData>(
          builder: (context, textPro, child) {
            return ListView.builder(
              itemCount: Provider.of<TaskData>(context).taskCount,
              // in listview builder it is very important to specify the itemCount
              itemBuilder: (context, index) {
                return ListTile(
                  leading: GestureDetector(
                      onTap: () {
                        textPro.deleteLists(textPro.list[index]);
                      },
                      child: Icon(Icons.delete)),
                  title: TextField(
                    autofocus: focus,
                    decoration: InputDecoration(
                      hintText: textPro.list[index].name,
                      hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                    onChanged: (value) {
                      textPro.list[index].name = value;
                    },
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      textPro.updateLists();
                    },
                    child: Icon(Icons.check),
                  ),
                );
              },
            );
          },
        ));
  }
}
