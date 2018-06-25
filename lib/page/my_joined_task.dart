import 'package:flutter/material.dart';

class MyJoinedTask extends StatefulWidget {
  MyJoinedTask({Key key}) : super(key: key);

  @override
  _MyJoinedTaskState createState() => _MyJoinedTaskState();
}

class _MyJoinedTaskState extends State<MyJoinedTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF0D0E15),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text(
          "我参与的任务",
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Color(0xFFF8F9FA),
    );
  }
}
