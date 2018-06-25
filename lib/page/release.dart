import 'package:flutter/material.dart';

class ReleasePage extends StatefulWidget {
  ReleasePage({Key key}) : super(key: key);

  @override
  _ReleasePageState createState() => _ReleasePageState();
}

class _ReleasePageState extends State<ReleasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar:  AppBar(
//        elevation: 0.0,
//        backgroundColor: Colors.white,
//        leading:  IconButton(
//            icon:  Icon(
//              Icons.arrow_back,
//              color: Color(0xFF0D0E15),
//            ),
//            onPressed: () {
//              Navigator.pop(context);
//            }),
//        centerTitle: true,
//        title:  Text(
//          "发布",
//          style:  TextStyle(
//            fontSize: 18.0,
//            color: Color(0xFF0D0E15),
//          ),
//        ),
//      ),
      backgroundColor: Color(0xFFF8F9FA),
      body: Column(children: <Widget>[
        Column(
          children: <Widget>[],
        ),
      ]),
    );
  }
}
