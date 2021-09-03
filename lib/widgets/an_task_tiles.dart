import 'package:flutter/material.dart';

class TaskTiles extends StatelessWidget {
  final bool isChanged;
  final String taskName;
  final Function(bool?) checkBoxCallback;
  final Function() deleteCallBack;

  TaskTiles(this.taskName, this.isChanged, this.checkBoxCallback,
      this.deleteCallBack);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: deleteCallBack,
      child: CheckboxListTile(
        value: isChanged,
        onChanged: checkBoxCallback,
        title: Text(
          taskName,
          style: TextStyle(
              fontSize: 18,
              decoration: isChanged ? TextDecoration.lineThrough : null),
        ),
        secondary: Icon(isChanged ? null : Icons.alarm),
      ),
    );
  }
}
