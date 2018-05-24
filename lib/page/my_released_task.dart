import 'package:flutter/material.dart';

class MyReleasesTask extends StatefulWidget {
  MyReleasesTask({Key key}) : super(key: key);

  @override
  _MyReleasesTaskState createState() => new _MyReleasesTaskState();
}

class _MyReleasesTaskState extends State<MyReleasesTask> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: const Color(0xFF0D0E15),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: new Text(
          "我发布的任务",
          style: new TextStyle(
            fontSize: 18.0,
            color: const Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF8F9FA),
    );
  }
}
