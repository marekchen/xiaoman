import 'package:flutter/material.dart';
import 'package:xiaoman/base/m_divider.dart';
import 'package:xiaoman/page/about_us.dart';
import 'package:xiaoman/page/account_security.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key key}) : super(key: key);

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
      body: new Column(children: <Widget>[
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
            padding: new EdgeInsets.all(16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "账号安全",
                  style: new TextStyle(
                      color: const Color(0xFF333333), fontSize: 16.0),
                ),
                new Icon(
                  Icons.keyboard_arrow_right,
                  color: const Color(0xFFACACAC),
                ),
              ],
            ),
          ),
        ),
        new MDivider(
          indent: 16.0,
          endIndent: 16.0,
          height: 0.0,
          color: const Color(0xFFF3F4F6),
        ),
        new InkWell(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new AboutUs()),
            );
          },
          child: new Container(
            height: 54.0,
            padding: new EdgeInsets.all(16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "关于我们",
                  style: new TextStyle(
                      color: const Color(0xFF333333), fontSize: 16.0),
                ),
                new Icon(
                  Icons.keyboard_arrow_right,
                  color: const Color(0xFFACACAC),
                ),
              ],
            ),
          ),
        ),
        new MDivider(
          indent: 16.0,
          endIndent: 16.0,
          height: 0.0,
          color: const Color(0xFFF3F4F6),
        ),
      ]),
    );
  }
}
