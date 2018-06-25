import 'package:flutter/material.dart';

class MyReleasesTask extends StatefulWidget {
  MyReleasesTask({Key key}) : super(key: key);

  @override
  _MyReleasesTaskState createState() => _MyReleasesTaskState();
}

class _MyReleasesTaskState extends State<MyReleasesTask> {
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
          },
        ),
        centerTitle: true,
        title: Text(
          "我发布的任务",
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
