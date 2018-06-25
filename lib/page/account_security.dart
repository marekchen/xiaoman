import 'package:flutter/material.dart';

import '../base/m_divider.dart';
import './dialog/change_password.dart';
import './dialog/change_phone_num.dart';

class AccountSecurity extends StatelessWidget {
  AccountSecurity({Key key}) : super(key: key);

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
          "账号安全",
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              padding: EdgeInsets.all(16.0),
              height: 54.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "修改手机号",
                    style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "133****1234",
                        style: TextStyle(
                          color: Color(0xFFACACAC),
                          fontSize: 15.0,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFFACACAC),
                      ),
                    ],
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<bool>(
                  builder: (BuildContext context) => ChangePhoneNumDialog(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          MDivider(
            indent: 16.0,
            endIndent: 16.0,
            height: 0.0,
            color: Color(0xFFF3F4F6),
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.all(16.0),
              height: 54.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "修改支付密码",
                    style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Color(0xFFACACAC),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<bool>(
                  builder: (BuildContext context) => ChangePasswordDialog(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          MDivider(
            indent: 16.0,
            endIndent: 16.0,
            height: 0.0,
            color: Color(0xFFF3F4F6),
          ),
          InkWell(
            child: Container(
              height: 54.0,
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 11.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/ic_wechat.png",
                        height: 32.0,
                        width: 32.0,
                      ),
                      Text(
                        "微信",
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "已绑定",
                        style: TextStyle(
                          color: Color(0xFF42BE56),
                          fontSize: 15.0,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFFACACAC),
                      ),
                    ],
                  )
                ],
              ),
            ),
            onTap: () {},
          ),
          MDivider(
            indent: 16.0,
            endIndent: 16.0,
            height: 0.0,
            color: Color(0xFFF3F4F6),
          ),
          InkWell(
            child: Container(
              height: 54.0,
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 11.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/ic_qq.png",
                        height: 32.0,
                        width: 32.0,
                      ),
                      Text(
                        "QQ",
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "未绑定",
                        style: TextStyle(
                          color: Color(0xFFACACAC),
                          fontSize: 15.0,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFFACACAC),
                      ),
                    ],
                  )
                ],
              ),
            ),
            onTap: () {},
          ),
          MDivider(
            indent: 16.0,
            endIndent: 16.0,
            height: 0.0,
            color: Color(0xFFF3F4F6),
          ),
        ],
      ),
    );
  }
}
