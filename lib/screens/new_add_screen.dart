import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 75.0, left: 50, right: 50),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add Task',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    autofocus: true,
                    scrollPadding: EdgeInsets.all(10),
                    textAlign: TextAlign.center,
                    onChanged: (value) {},
                    cursorColor: Colors.grey,
                    cursorHeight: 25,
                    style: TextStyle(fontSize: 20, fontFamily: 'Mont'),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RawMaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(10),
                      fillColor: Colors.lightBlueAccent,
                      onPressed: () {},
                      child: Text(
                        'Add',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 30),
                      ))
                ],
              ),
              SizedBox(
                height: 330,
              )
            ],
          ),
        ),
      ),
    );
  }
}
