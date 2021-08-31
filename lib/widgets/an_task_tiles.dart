import 'package:flutter/material.dart';

class TaskTiles extends StatelessWidget {
  bool isChanged;
  final String taskName;
  final Function(bool?) checkBoxCallback;

  TaskTiles(this.taskName, this.isChanged, this.checkBoxCallback);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChanged,
      onChanged: checkBoxCallback,
      title: Text(
        taskName,
        style: TextStyle(
            fontSize: 18,
            decoration: isChanged ? TextDecoration.lineThrough : null),
      ),
      secondary: Icon(isChanged ? null : Icons.alarm),
    );
  }
}
