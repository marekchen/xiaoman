import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'my_follow.dart';
import 'my_money.dart';

class Mine extends StatefulWidget {
  Mine({Key key}) : super(key: key);

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: new IconButton(
            icon: new Icon(
              Icons.mail_outline,
              color: const Color(0xFF0D0E15),
            ),
            onPressed: null),
        centerTitle: true,
        title: new Text(
          "我的",
          style: new TextStyle(
            fontSize: 18.0,
            color: const Color(0xFF0D0E15),
          ),
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.settings,
                color: const Color(0xFF0D0E15),
              ),
              onPressed: null)
        ],
        //bottom: new MineHeader(),
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: new MineBody(),
    );
  }
}

class MineBody extends StatefulWidget {
  MineBody({Key key}) : super(key: key);

  @override
  _MineBodyState createState() => new _MineBodyState();
}

class _MineBodyState extends State<MineBody> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          color: Colors.white,
          child: new Column(
            children: <Widget>[
              new Container(
                height: 98.0,
                padding: new EdgeInsets.only(left: 16.0, right: 16.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "劈里啪啦酱",
                      style: new TextStyle(
                        color: const Color(0xFF0D0E15),
                        fontSize: 24.0,
                      ),
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
                            padding: new EdgeInsets.only(left: 16.0),
                            icon: new Icon(Icons.keyboard_arrow_right),
                            onPressed: null),
                      ],
                    ),
                  ],
                ),
              ),
              new Container(
                color: const Color(0xFFF8F9FA),
                height: 10.0,
              ),
              new Padding(
                padding: new EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
                child: new Container(
                  height: 54.0,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new IconButton(
                              padding: new EdgeInsets.only(right: 10.0),
                              icon: new Icon(Icons.event_available),
                              onPressed: null),
                          new Text(
                            "我参与的",
                            style: new TextStyle(
                                color: const Color(0xFF333333), fontSize: 16.0),
                          )
                        ],
                      ),
                      new IconButton(
                          padding: new EdgeInsets.only(left: 16.0),
                          icon: new Icon(Icons.keyboard_arrow_right),
                          onPressed: null),
                    ],
                  ),
                ),
              ),
              new Divider(
                  height: 0.0, indent: 50.0, color: const Color(0xFFF8F9FA)),
              new Padding(
                padding: new EdgeInsets.only(left: 16.0, right: 16.0),
                child: new Container(
                  height: 54.0,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new IconButton(
                              padding: new EdgeInsets.only(right: 10.0),
                              icon: new Icon(Icons.lightbulb_outline),
                              onPressed: null),
                          new Text(
                            "我发布的",
                            style: new TextStyle(
                                color: const Color(0xFF333333), fontSize: 16.0),
                          )
                        ],
                      ),
                      new IconButton(
                          padding: new EdgeInsets.only(left: 16.0),
                          icon: new Icon(Icons.keyboard_arrow_right),
                          onPressed: null),
                    ],
                  ),
                ),
              ),
              new Divider(
                  height: 0.0, indent: 50.0, color: const Color(0xFFF8F9FA)),
              new Padding(
                padding: new EdgeInsets.only(left: 16.0, right: 16.0),
                child: new Container(
                  height: 54.0,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new IconButton(
                              padding: new EdgeInsets.only(right: 10.0),
                              icon: new Icon(Icons.schedule),
                              onPressed: null),
                          new Text(
                            "历史浏览",
                            style: new TextStyle(
                                color: const Color(0xFF333333), fontSize: 16.0),
                          )
                        ],
                      ),
                      new IconButton(
                          padding: new EdgeInsets.only(left: 16.0),
                          icon: new Icon(Icons.keyboard_arrow_right),
                          onPressed: null),
                    ],
                  ),
                ),
              ),
              new Container(
                color: const Color(0xFFF8F9FA),
                height: 10.0,
              ),
              new InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new MyFollow()),
                  );
                },
                child: new Padding(
                  padding: new EdgeInsets.only(left: 16.0, right: 16.0),
                  child: new Container(
                    height: 54.0,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new IconButton(
                                padding: new EdgeInsets.only(right: 10.0),
                                icon: new Icon(Icons.center_focus_strong),
                                onPressed: null),
                            new Text(
                              "我的关注",
                              style: new TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 16.0),
                            )
                          ],
                        ),
                        new IconButton(
                            padding: new EdgeInsets.only(left: 16.0),
                            icon: new Icon(Icons.keyboard_arrow_right),
                            onPressed: null),
                      ],
                    ),
                  ),
                ),
              ),
              new Divider(
                  height: 0.0, indent: 50.0, color: const Color(0xFFF8F9FA)),
              new Padding(
                padding: new EdgeInsets.only(left: 16.0, right: 16.0),
                child: new Container(
                  height: 54.0,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new IconButton(
                              padding: new EdgeInsets.only(right: 10.0),
                              icon: new Icon(Icons.star_border),
                              onPressed: null),
                          new Text(
                            "我的收藏",
                            style: new TextStyle(
                                color: const Color(0xFF333333), fontSize: 16.0),
                          )
                        ],
                      ),
                      new IconButton(
                          padding: new EdgeInsets.only(left: 16.0),
                          icon: new Icon(Icons.keyboard_arrow_right),
                          onPressed: null),
                    ],
                  ),
                ),
              ),
              new Divider(
                  height: 0.0, indent: 50.0, color: const Color(0xFFF8F9FA)),
              new InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new MyMoney()),
                  );
                },
                child: new Padding(
                  padding: new EdgeInsets.only(left: 16.0, right: 16.0),
                  child: new Container(
                    height: 54.0,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new IconButton(
                                padding: new EdgeInsets.only(right: 10.0),
                                icon: new Icon(Icons.attach_money),
                                onPressed: null),
                            new Text(
                              "我的钱包",
                              style: new TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 16.0),
                            )
                          ],
                        ),
                        new IconButton(
                            padding: new EdgeInsets.only(left: 16.0),
                            icon: new Icon(Icons.keyboard_arrow_right),
                            onPressed: null),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
