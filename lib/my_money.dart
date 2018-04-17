import 'package:flutter/material.dart';

class MyMoney extends StatefulWidget {
  MyMoney({Key key}) : super(key: key);

  @override
  _MyMoneyState createState() => new _MyMoneyState();
}

class _MyMoneyState extends State<MyMoney> {
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
          "我的钱包",
          style: new TextStyle(
            fontSize: 18.0,
            color: const Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: new Body(),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => new _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          height: 120.0,
          color: const Color(0xFF42BE56),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "￥27",
                    style: new TextStyle(color: Colors.white, fontSize: 28.0),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 9.0),
                    child: new Text(
                      "余额",
                      style: new TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                ],
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "308",
                    style: new TextStyle(color: Colors.white, fontSize: 28.0),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 9.0),
                    child: new Text(
                      "小满币",
                      style: new TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        new Container(
          color: Colors.white,
          height: 54.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "交易记录",
                style: new TextStyle(
                  color: const Color(0xFF768196),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
