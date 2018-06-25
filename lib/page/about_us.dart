import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  AboutUs({Key key}) : super(key: key);

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
          "关于我们",
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 56.0,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: Image.asset(
                "assets/logo.png",
                height: 120.0,
                width: 120.0,
              ),
            ),
          ),
          Positioned(
            bottom: 56.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              children: <Widget>[
                Text(
                  "版本号: 1.0.0",
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "上海xxxxxx公司",
                    style: TextStyle(
                      color: Color(0xFFACACAC),
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
