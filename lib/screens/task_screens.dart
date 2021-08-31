import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_list/widgets/task_lists.dart';
import 'new_add_screen.dart';
import 'package:todoey_list/tasks.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Tasks> list = [
    Tasks(name: 'Buy Bread'),
    Tasks(name: 'Do Homework'),
    Tasks(name: 'Buy Fruits'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTasks(() {
              setState(() {
                list.add(Tasks(name: AddTasks.newTask));
              });
              Navigator.pop(context);
            }),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Icon(
                      Icons.list,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${list.length} Tasks',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: TaskLists(list),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
