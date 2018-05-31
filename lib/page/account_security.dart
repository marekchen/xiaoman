import 'package:flutter/material.dart';

class AccountSecurity extends StatelessWidget {
  AccountSecurity({Key key}) : super(key: key);

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
          "账号安全",
          style: new TextStyle(
            fontSize: 18.0,
            color: const Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: new Padding(
        padding: new EdgeInsets.symmetric(horizontal: 16.0),
        child: new Column(children: <Widget>[
          new InkWell(
            child: new Container(
              height: 54.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "修改手机号",
                    style: new TextStyle(
                        color: const Color(0xFF333333), fontSize: 16.0),
                  ),
                  new Row(
                    children: <Widget>[
                      new Text(
                        "133****1234",
                        style: new TextStyle(
                          color: const Color(0xFFACACAC),
                          fontSize: 15.0,
                        ),
                      ),
                      new IconButton(
                          padding: new EdgeInsets.only(left: 10.0),
                          icon: new Icon(
                            Icons.keyboard_arrow_right,
                            color: const Color(0xFFACACAC),
                          ),
                          onPressed: null),
                    ],
                  )
                ],
              ),
            ),
            onTap: () {},
          ),
          new Divider(height: 0.0, color: const Color(0xFFF3F4F6)),
          new InkWell(
            child: new Container(
              height: 54.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "修改密码",
                    style: new TextStyle(
                        color: const Color(0xFF333333), fontSize: 16.0),
                  ),
                  new IconButton(
                      padding: new EdgeInsets.only(left: 10.0),
                      icon: new Icon(
                        Icons.keyboard_arrow_right,
                        color: const Color(0xFFACACAC),
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
          ),
          new Divider(height: 0.0, color: const Color(0xFFF3F4F6)),
          new InkWell(
            child: new Container(
              height: 54.0,
              margin: new EdgeInsets.only(top: 27.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Image.asset(
                        "assets/ic_wechat.png",
                        height: 32.0,
                        width: 32.0,
                      ),
                      new Text(
                        "微信",
                        style: new TextStyle(
                            color: const Color(0xFF333333), fontSize: 16.0),
                      ),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Text(
                        "已绑定",
                        style: new TextStyle(
                          color: const Color(0xFF42BE56),
                          fontSize: 15.0,
                        ),
                      ),
                      new IconButton(
                          padding: new EdgeInsets.only(left: 10.0),
                          icon: new Icon(
                            Icons.keyboard_arrow_right,
                            color: const Color(0xFFACACAC),
                          ),
                          onPressed: null),
                    ],
                  )
                ],
              ),
            ),
          ),
          new Divider(height: 0.0, color: const Color(0xFFF3F4F6)),
          new InkWell(
            child: new Container(
              height: 54.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Image.asset(
                        "assets/ic_qq.png",
                        height: 32.0,
                        width: 32.0,
                      ),
                      new Text(
                        "QQ",
                        style: new TextStyle(
                            color: const Color(0xFF333333), fontSize: 16.0),
                      ),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Text(
                        "未绑定",
                        style: new TextStyle(
                          color: const Color(0xFFACACAC),
                          fontSize: 15.0,
                        ),
                      ),
                      new IconButton(
                          padding: new EdgeInsets.only(left: 10.0),
                          icon: new Icon(
                            Icons.keyboard_arrow_right,
                            color: const Color(0xFFACACAC),
                          ),
                          onPressed: null),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
