import 'package:flutter/material.dart';

class TaskTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        'This is a new Task',
        style: TextStyle(fontSize: 18),
      ),
      trailing: Checkbox(
        onChanged: (value) {},
        value: false,
        activeColor: Colors.lightBlue,
      ),
    );
  }
}
