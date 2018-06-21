import 'package:flutter/material.dart';

class MyWallet extends StatefulWidget {
  MyWallet({Key key}) : super(key: key);

  @override
  _MyWalletState createState() => new _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
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
          height: 180.0,
          color: const Color(0xFF42BE56),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "￥27",
                        style:
                            new TextStyle(color: Colors.white, fontSize: 28.0),
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(top: 9.0),
                        child: new Text(
                          "余额",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 12.0),
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
                        style:
                            new TextStyle(color: Colors.white, fontSize: 28.0),
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(top: 9.0),
                        child: new Text(
                          "小满币",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              new RaisedButton(
                color: Colors.white,
                padding: new EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 120.0,
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(4.0),
                ),
                child: new Text(
                  "充值",
                  style: new TextStyle(
                    color: const Color(0xFF42BE56),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        new Padding(
          padding: new EdgeInsets.only(top: 12.0),
          child: new Container(
            color: Colors.white,
            height: 54.0,
            child: new Center(
              child: new Text(
                "交易记录",
                style: new TextStyle(
                  color: const Color(0xFF768196),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        new Divider(height: 0.0, color: const Color(0xFFF3F4F6)),
        new Container(
          height: 54.0,
          color: Colors.white,
          padding: new EdgeInsets.symmetric(horizontal: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "描述描述描述描述描述描述描述描述",
                    style: new TextStyle(
                      color: const Color(0xFF768196),
                      fontSize: 12.0,
                    ),
                  ),
                  new Text(
                    "2018.05.11",
                    style: new TextStyle(
                      color: const Color(0xFFACACAC),
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              new Text(
                "+27.0元",
                style: new TextStyle(
                  color: const Color(0xFF42BE56),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        new Divider(height: 0.0, color: const Color(0xFFF3F4F6)),
        new Container(
          height: 54.0,
          color: Colors.white,
          padding: new EdgeInsets.symmetric(horizontal: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "描述描述描述描述描述描述描述描述",
                    style: new TextStyle(
                      color: const Color(0xFF768196),
                      fontSize: 12.0,
                    ),
                  ),
                  new Text(
                    "2018.05.11",
                    style: new TextStyle(
                      color: const Color(0xFFACACAC),
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              new Text(
                "+27.0元",
                style: new TextStyle(
                  color: const Color(0xFF42BE56),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        new Divider(height: 0.0, color: const Color(0xFFF3F4F6)),
        new Container(
          height: 54.0,
          color: Colors.white,
          padding: new EdgeInsets.symmetric(horizontal: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "描述描述描述描述描述描述描述描述",
                    style: new TextStyle(
                      color: const Color(0xFF768196),
                      fontSize: 12.0,
                    ),
                  ),
                  new Text(
                    "2018.05.11",
                    style: new TextStyle(
                      color: const Color(0xFFACACAC),
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              new Text(
                "+27.0元",
                style: new TextStyle(
                  color: const Color(0xFF42BE56),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        new Divider(height: 0.0, color: const Color(0xFFF3F4F6)),
        new Container(
          height: 54.0,
          color: Colors.white,
          padding: new EdgeInsets.symmetric(horizontal: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "描述描述描述描述描述描述描述描述",
                    style: new TextStyle(
                      color: const Color(0xFF768196),
                      fontSize: 12.0,
                    ),
                  ),
                  new Text(
                    "2018.05.11",
                    style: new TextStyle(
                      color: const Color(0xFFACACAC),
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              new Text(
                "+27.0元",
                style: new TextStyle(
                  color: const Color(0xFF42BE56),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        new Divider(height: 0.0, color: const Color(0xFFF3F4F6)),
        new Container(
          height: 54.0,
          color: Colors.white,
          padding: new EdgeInsets.symmetric(horizontal: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "描述描述描述描述描述描述描述描述",
                    style: new TextStyle(
                      color: const Color(0xFF768196),
                      fontSize: 12.0,
                    ),
                  ),
                  new Text(
                    "2018.05.11",
                    style: new TextStyle(
                      color: const Color(0xFFACACAC),
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              new Text(
                "+27.0元",
                style: new TextStyle(
                  color: const Color(0xFF42BE56),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        new Divider(height: 0.0, color: const Color(0xFFF3F4F6)),
        new Container(
          height: 54.0,
          color: Colors.white,
          padding: new EdgeInsets.symmetric(horizontal: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "描述描述描述描述描述描述描述描述",
                    style: new TextStyle(
                      color: const Color(0xFF768196),
                      fontSize: 12.0,
                    ),
                  ),
                  new Text(
                    "2018.05.11",
                    style: new TextStyle(
                      color: const Color(0xFFACACAC),
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              new Text(
                "+27.0元",
                style: new TextStyle(
                  color: const Color(0xFF42BE56),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        new Divider(height: 0.0, color: const Color(0xFFF3F4F6)),
        new Container(
          height: 54.0,
          color: Colors.white,
          padding: new EdgeInsets.symmetric(horizontal: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "描述描述描述描述描述描述描述描述",
                    style: new TextStyle(
                      color: const Color(0xFF768196),
                      fontSize: 12.0,
                    ),
                  ),
                  new Text(
                    "2018.05.11",
                    style: new TextStyle(
                      color: const Color(0xFFACACAC),
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              new Text(
                "+27.0元",
                style: new TextStyle(
                  color: const Color(0xFF42BE56),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        new Divider(height: 0.0, color: const Color(0xFFF3F4F6)),
//        new ListView.builder(
//          itemBuilder: (context, index) {
//            return new Row(
//              children: <Widget>[
//
//              ],
//            );
//          },
//          itemCount: 6,
//        )
      ],
    );
  }
}
