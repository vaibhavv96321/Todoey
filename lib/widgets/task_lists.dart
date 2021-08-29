import 'package:flutter/material.dart';
import 'task_tiles.dart';

class TaskLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTiles(),
        TaskTiles(),
        TaskTiles(),
      ],
    );
  }
}
