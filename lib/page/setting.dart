import 'package:flutter/material.dart';

import '../base/m_divider.dart';
import './about_us.dart';
import './account_security.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key key}) : super(key: key);

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
          "设置",
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountSecurity()),
            );
          },
          child: Container(
            height: 54.0,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "账号安全",
                  style:
                      TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xFFACACAC),
                ),
              ],
            ),
          ),
        ),
        MDivider(
          indent: 16.0,
          endIndent: 16.0,
          height: 0.0,
          color: Color(0xFFF3F4F6),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUs()),
            );
          },
          child: Container(
            height: 54.0,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "关于我们",
                  style:
                      TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xFFACACAC),
                ),
              ],
            ),
          ),
        ),
        MDivider(
          indent: 16.0,
          endIndent: 16.0,
          height: 0.0,
          color: Color(0xFFF3F4F6),
        ),
      ]),
    );
  }
}
