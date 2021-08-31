import 'package:flutter/material.dart';

class TaskTiles extends StatefulWidget {
  @override
  _TaskTilesState createState() => _TaskTilesState();
}

class _TaskTilesState extends State<TaskTiles> {
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChanged,
      onChanged: (bool? newValue) {
        setState(() {
          isChanged = newValue!;
        });
      },
      activeColor: Colors.lightBlueAccent,
      title: Text(
        'This is a new Task',
        style: TextStyle(
          fontSize: 18,
          decoration: isChanged ? TextDecoration.lineThrough : null,
        ),
      ),
      secondary: Icon(Icons.alarm),
    );
  }
}
