import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  AboutUs({Key key}) : super(key: key);

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
          "关于我们",
          style: new TextStyle(
            fontSize: 18.0,
            color: const Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: new Stack(
        children: <Widget>[
          new Positioned(
            top: 56.0,
            left: 0.0,
            right: 0.0,
            child: new Center(
              child: new Image.asset(
                "assets/logo.png",
                height: 120.0,
                width: 120.0,
              ),
            ),
          ),
          new Positioned(
            bottom: 56.0,
            left: 0.0,
            right: 0.0,
            child: new Column(
              children: <Widget>[
                new Text(
                  "版本号: 1.0.0",
                  style: new TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                  child: new Text(
                    "上海xxxxxx公司",
                    style: new TextStyle(
                      color: const Color(0xFFACACAC),
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
