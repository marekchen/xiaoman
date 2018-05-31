import 'package:flutter/material.dart';
import 'package:xiaoman/page/about_us.dart';
import 'package:xiaoman/page/account_security.dart';

class Setting extends StatelessWidget {
  Setting({Key key}) : super(key: key);

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
          "设置",
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
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new AccountSecurity()),
              );
            },
            child: new Container(
              height: 54.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "账号安全",
                    style: new TextStyle(
                        color: const Color(0xFF333333), fontSize: 16.0),
                  ),
                  new IconButton(
                    padding: new EdgeInsets.only(left: 10.0),
                    icon: new Icon(
                      Icons.keyboard_arrow_right,
                      color: const Color(0xFFACACAC),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new AccountSecurity()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          new Divider(height: 0.0, color: const Color(0xFFF3F4F6)),
          new InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new AboutUs()),
              );
            },
            child: new Container(
              height: 54.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "关于我们",
                    style: new TextStyle(
                        color: const Color(0xFF333333), fontSize: 16.0),
                  ),
                  new IconButton(
                    padding: new EdgeInsets.only(left: 10.0),
                    icon: new Icon(
                      Icons.keyboard_arrow_right,
                      color: const Color(0xFFACACAC),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new AboutUs()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          new Divider(height: 0.0, color: const Color(0xFFF3F4F6)),
        ]),
      ),
    );
  }
}
