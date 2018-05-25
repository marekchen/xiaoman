import 'package:flutter/material.dart';

class Release extends StatefulWidget {
  Release({Key key}) : super(key: key);

  @override
  _ReleaseState createState() => new _ReleaseState();
}

class _ReleaseState extends State<Release> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        elevation: 0.0,
//        backgroundColor: Colors.white,
//        leading: new IconButton(
//            icon: new Icon(
//              Icons.arrow_back,
//              color: const Color(0xFF0D0E15),
//            ),
//            onPressed: () {
//              Navigator.pop(context);
//            }),
//        centerTitle: true,
//        title: new Text(
//          "发布",
//          style: new TextStyle(
//            fontSize: 18.0,
//            color: const Color(0xFF0D0E15),
//          ),
//        ),
//      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: new Column(children: <Widget>[
        new Column(
          children: <Widget>[

          ],
        ),
      ]),
    );
  }
}
