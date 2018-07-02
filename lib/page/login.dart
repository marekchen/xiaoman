import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './login_phone.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            bottom: 100.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              children: <Widget>[
                CupertinoButton(
                  child: Text('手机号登录/注册'),
                  color: Color(0xFF42BE56),
                  pressedOpacity: 0.2,
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 80.0),
                  minSize: 30.0,
                  borderRadius: BorderRadius.all(Radius.circular(22.0)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPhonePage(),
                      ),
                    );
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 43.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/ic_wechat.png",
                            height: 32.0,
                            width: 32.0,
                          ),
                          Text(
                            "微信登录",
                            style: TextStyle(
                                color: Color(0xFF838EA0), fontSize: 16.0),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/ic_qq.png",
                            height: 32.0,
                            width: 32.0,
                          ),
                          Text(
                            "QQ登录",
                            style: TextStyle(
                                color: Color(0xFF838EA0), fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
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
