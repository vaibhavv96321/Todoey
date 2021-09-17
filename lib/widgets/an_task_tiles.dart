import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:todoey_list/main.dart';
import 'package:todoey_list/screens/new_add_screen.dart';

class TaskTiles extends StatefulWidget {
  final bool isChanged;
  final String taskName;
  final Function(bool?) checkBoxCallback;
  final Function() deleteCallBack;

  TaskTiles(this.taskName, this.isChanged, this.checkBoxCallback,
      this.deleteCallBack);

  @override
  _TaskTilesState createState() => _TaskTilesState();
}

class _TaskTilesState extends State<TaskTiles> {
  final DateTime _selectedTime = DateTime.now();
  String _stringTime = '8:00 AM';
  Future<void> _openTimePicker(BuildContext context) async {
    final TimeOfDay? t =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (t != null) {
      setState(() {
        _stringTime = t.format(context);
        if (widget.isChanged == true) {
          scheduleAlarm(DateTime(
              // because timeofDay only contains hour and minute and DateTime contains many things
              _selectedTime.year,
              _selectedTime.month,
              _selectedTime.day,
              t.hour,
              t.minute));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.deleteCallBack,
      child: CheckboxListTile(
        value: widget.isChanged,
        onChanged: widget.checkBoxCallback,
        title: Text(
          widget.taskName,
          style: TextStyle(
              fontSize: 18,
              decoration: widget.isChanged ? TextDecoration.lineThrough : null),
        ),
        secondary: RawMaterialButton(
          child: Column(
            children: [
              Icon(
                Icons.alarm,
                size: 28,
              ),
              Text(_stringTime),
            ],
          ),
          onPressed: () {
            _openTimePicker(context);
          },
        ),
      ),
    );
  }
}

void scheduleAlarm(DateTime scheduledNotificationDateTime) async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'alarm_notif',
    'alarm_notif',
    'Channel for Alarm notification',
    icon: 'todo',
    largeIcon: DrawableResourceAndroidBitmap('todo'),
  );

  var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      presentAlert: true, presentBadge: true, presentSound: true);
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.schedule(
      0,
      AddTasks.newTask,
      "It look you have a remaining task in your list 😊",
      scheduledNotificationDateTime,
      platformChannelSpecifics);
}
