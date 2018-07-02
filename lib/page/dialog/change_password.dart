import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../base/m_divider.dart';

class ChangePasswordDialog extends StatefulWidget {
  @override
  ChangePasswordDialogState createState() => ChangePasswordDialogState();
}

class ChangePasswordDialogState extends State<ChangePasswordDialog> {
  String phoneNum;
  String pinCode;

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
          "修改支付密码",
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF0D0E15),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text(
                      "手机号",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      textAlign: TextAlign.start,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(11),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '请输入手机号',
                        hintStyle: TextStyle(
                          color: Color(0xFF768196),
                          fontSize: 18.0,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      onChanged: (String value) {
                        setState(() {
                          this.phoneNum = value;
                        });
                      },
                    ),
                  ),
                  CupertinoButton(
                    child: Text(
                      '获取验证码',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    color: Color(0xFF42BE56),
                    pressedOpacity: 0.2,
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    minSize: 30.0,
                    borderRadius:
                        BorderRadius.all(Radius.circular(15.0)),
                    onPressed: () {
                      requestPinCode();
                    },
                  ),
                ],
              ),
            ),
            MDivider(indent: 16.0, color: Color(0xFFF3F4F6)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text(
                      "验证码",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      textAlign: TextAlign.start,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(6),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '请输入验证码',
                        hintStyle: TextStyle(
                          color: Color(0xFF768196),
                          fontSize: 18.0,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      onChanged: (String value) {
                        setState(() {
                          this.pinCode = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            MDivider(indent: 16.0, color: Color(0xFFF3F4F6)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 18.0),
                    child: Text(
                      "支付密码",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      textAlign: TextAlign.start,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(6),
                      ],
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '请输入支付密码',
                        hintStyle: TextStyle(
                          color: Color(0xFF768196),
                          fontSize: 18.0,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      onChanged: (String value) {
                        setState(() {
                          this.pinCode = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            MDivider(indent: 16.0, color: Color(0xFFF3F4F6)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 18.0),
                    child: Text(
                      "确认密码",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      textAlign: TextAlign.start,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(6),
                      ],
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '请再次输入支付密码',
                        hintStyle: TextStyle(
                          color: Color(0xFF768196),
                          fontSize: 18.0,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      onChanged: (String value) {
                        setState(() {
                          this.pinCode = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            MDivider(indent: 16.0, color: Color(0xFFF3F4F6)),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CupertinoButton(
                      child: Text('确认修改支付密码'),
                      color: Color(0xFF42BE56),
                      pressedOpacity: 0.2,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 80.0),
                      minSize: 30.0,
                      borderRadius:
                          BorderRadius.all(Radius.circular(22.0)),
                      onPressed: () {
                        bindPhoneNum();
                      },
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16.0),
            ),
          ],
        ),
      ),
    );
  }

  void requestPinCode() {
    String phoneNum = this.phoneNum;
    String userId;
  }

  void bindPhoneNum() {
    String phoneNum = this.phoneNum;
    String pinCode = this.pinCode;
    String userId;
  }
}
