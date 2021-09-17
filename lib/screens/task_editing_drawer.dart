import 'package:flutter/material.dart';
import 'package:todoey_list/widgets/task_lists.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
            child: ListView(
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Tasks',
                  style: TextStyle(
                    fontSize: 43,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '(Edit Your Tasks)',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          EditedTaskList(),
        ],
      ),
    );
  }
}
