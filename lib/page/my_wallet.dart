import 'package:flutter/material.dart';

class MyWallet extends StatefulWidget {
  MyWallet({Key key}) : super(key: key);

  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
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
          "我的钱包",
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Color(0xFFF8F9FA),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 180.0,
          color: Color(0xFF42BE56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "￥27",
                        style: TextStyle(color: Colors.white, fontSize: 28.0),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 9.0),
                        child: Text(
                          "余额",
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "308",
                        style: TextStyle(color: Colors.white, fontSize: 28.0),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 9.0),
                        child: Text(
                          "小满币",
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              RaisedButton(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 120.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  "充值",
                  style: TextStyle(
                    color: Color(0xFF42BE56),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Container(
            color: Colors.white,
            height: 54.0,
            child: Center(
              child: Text(
                "交易记录",
                style: TextStyle(
                  color: Color(0xFF768196),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Divider(height: 0.0, color: Color(0xFFF3F4F6)),
        Container(
          height: 54.0,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "描述描述描述描述描述描述描述描述",
                    style: TextStyle(
                      color: Color(0xFF768196),
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "2018.05.11",
                    style: TextStyle(
                      color: Color(0xFFACACAC),
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              Text(
                "+27.0元",
                style: TextStyle(
                  color: Color(0xFF42BE56),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 0.0, color: Color(0xFFF3F4F6)),
        Container(
          height: 54.0,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "描述描述描述描述描述描述描述描述",
                    style: TextStyle(
                      color: Color(0xFF768196),
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "2018.05.11",
                    style: TextStyle(
                      color: Color(0xFFACACAC),
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              Text(
                "+27.0元",
                style: TextStyle(
                  color: Color(0xFF42BE56),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 0.0, color: Color(0xFFF3F4F6)),
        Container(
          height: 54.0,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "描述描述描述描述描述描述描述描述",
                    style: TextStyle(
                      color: Color(0xFF768196),
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "2018.05.11",
                    style: TextStyle(
                      color: Color(0xFFACACAC),
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              Text(
                "+27.0元",
                style: TextStyle(
                  color: Color(0xFF42BE56),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 0.0, color: Color(0xFFF3F4F6)),
        Container(
          height: 54.0,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "描述描述描述描述描述描述描述描述",
                    style: TextStyle(
                      color: Color(0xFF768196),
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "2018.05.11",
                    style: TextStyle(
                      color: Color(0xFFACACAC),
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              Text(
                "+27.0元",
                style: TextStyle(
                  color: Color(0xFF42BE56),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 0.0, color: Color(0xFFF3F4F6)),
        Container(
          height: 54.0,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "描述描述描述描述描述描述描述描述",
                    style: TextStyle(
                      color: Color(0xFF768196),
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "2018.05.11",
                    style: TextStyle(
                      color: Color(0xFFACACAC),
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              Text(
                "+27.0元",
                style: TextStyle(
                  color: Color(0xFF42BE56),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 0.0, color: Color(0xFFF3F4F6)),
        Container(
          height: 54.0,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "描述描述描述描述描述描述描述描述",
                    style: TextStyle(
                      color: Color(0xFF768196),
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "2018.05.11",
                    style: TextStyle(
                      color: Color(0xFFACACAC),
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              Text(
                "+27.0元",
                style: TextStyle(
                  color: Color(0xFF42BE56),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 0.0, color: Color(0xFFF3F4F6)),
        Container(
          height: 54.0,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "描述描述描述描述描述描述描述描述",
                    style: TextStyle(
                      color: Color(0xFF768196),
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "2018.05.11",
                    style: TextStyle(
                      color: Color(0xFFACACAC),
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              Text(
                "+27.0元",
                style: TextStyle(
                  color: Color(0xFF42BE56),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 0.0, color: Color(0xFFF3F4F6)),
//         ListView.builder(
//          itemBuilder: (context, index) {
//            return  Row(
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
