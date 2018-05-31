import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({Key key}) : super(key: key);

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
          "个人信息",
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
        new Padding(
          padding: new EdgeInsets.only(top: 1.0),
          child: new InkWell(
            child: new Container(
              height: 100.0,
              color: Colors.white,
              padding: new EdgeInsets.only(left: 11.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "头像",
                    style: new TextStyle(
                        color: const Color(0xFF333333), fontSize: 16.0),
                  ),
                  new Row(
                    children: <Widget>[
                      new CircleAvatar(
                        radius: 30.0,
                        backgroundImage: new NetworkImage(
                          "http://img4.duitang.com/uploads/item/201602/12/20160212172715_MCUtT.jpeg",
                        ),
                      ),
                      new IconButton(
                          padding: new EdgeInsets.only(left: 0.0),
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
        ),
        new Divider(height: 0.0, indent: 12.0, color: const Color(0xFFF3F4F6)),
        new InkWell(
          child: new Container(
            height: 54.0,
            color: Colors.white,
            padding: new EdgeInsets.only(left: 11.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "昵称",
                  style: new TextStyle(
                      color: const Color(0xFF333333), fontSize: 16.0),
                ),
                new Row(
                  children: <Widget>[
                    new Text(
                      "噼里啪啦酱",
                      style: new TextStyle(
                        color: const Color(0xFFACACAC),
                        fontSize: 15.0,
                      ),
                    ),
                    new IconButton(
                        padding: new EdgeInsets.only(left: 0.0),
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
        new Divider(height: 0.0, indent: 12.0, color: const Color(0xFFF3F4F6)),
        new Padding(
          padding: new EdgeInsets.only(top: 9.0),
          child: new InkWell(
            child: new Container(
              height: 54.0,
              color: Colors.white,
              padding: new EdgeInsets.only(left: 11.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "性别",
                    style: new TextStyle(
                        color: const Color(0xFF333333), fontSize: 16.0),
                  ),
                  new Row(
                    children: <Widget>[
                      new Text(
                        "男",
                        style: new TextStyle(
                          color: const Color(0xFFACACAC),
                          fontSize: 15.0,
                        ),
                      ),
                      new IconButton(
                          padding: new EdgeInsets.only(left: 0.0),
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
        ),
        new Divider(height: 0.0, indent: 12.0, color: const Color(0xFFF3F4F6)),
        new InkWell(
          child: new Container(
            height: 54.0,
            color: Colors.white,
            padding: new EdgeInsets.only(left: 11.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "地区",
                  style: new TextStyle(
                      color: const Color(0xFF333333), fontSize: 16.0),
                ),
                new Row(
                  children: <Widget>[
                    new Text(
                      "上海",
                      style: new TextStyle(
                        color: const Color(0xFFACACAC),
                        fontSize: 15.0,
                      ),
                    ),
                    new IconButton(
                        padding: new EdgeInsets.only(left: 0.0),
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
        new Divider(height: 0.0, indent: 12.0, color: const Color(0xFFF3F4F6)),
        new InkWell(
          child: new Container(
            height: 54.0,
            color: Colors.white,
            padding: new EdgeInsets.only(left: 11.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "个人简介",
                  style: new TextStyle(
                      color: const Color(0xFF333333), fontSize: 16.0),
                ),
                new Row(
                  children: <Widget>[
                    new Text(
                      "噼里啪啦酱",
                      style: new TextStyle(
                        color: const Color(0xFFACACAC),
                        fontSize: 15.0,
                      ),
                    ),
                    new IconButton(
                        padding: new EdgeInsets.only(left: 0.0),
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
        new Divider(height: 0.0, indent: 12.0, color: const Color(0xFFF3F4F6)),
      ],
    );
  }
}
